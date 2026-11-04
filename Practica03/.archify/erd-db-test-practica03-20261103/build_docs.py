import json, re, html, pathlib, subprocess

ROOT = pathlib.Path(__file__).resolve().parents[2]
OUT = pathlib.Path(__file__).resolve().parent
SQLPATH = pathlib.Path('Practica03/backups/respaldo031126.sql')
SQL = (ROOT / SQLPATH).read_text(encoding='utf-8')
REV = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip()
ORIGIN = subprocess.check_output(['git', 'remote', 'get-url', 'origin'], cwd=ROOT, text=True).strip()
ORIGIN = re.sub(r'^(https?://)[^/@]+@', r'\1', ORIGIN)
LINES = SQL.splitlines()

def split_top(s):
    out=[]; start=0; depth=0; quote=None; esc=False
    for i,ch in enumerate(s):
        if esc: esc=False; continue
        if ch=='\\' and quote: esc=True; continue
        if quote:
            if ch==quote: quote=None
            continue
        if ch in "'\"`": quote=ch; continue
        if ch=='(': depth+=1
        elif ch==')': depth-=1
        elif ch==',' and depth==0: out.append(s[start:i].strip()); start=i+1
    out.append(s[start:].strip())
    return [x for x in out if x]

def line_for(text):
    needle=text[:min(120,len(text))]
    for i,l in enumerate(LINES,1):
        if needle and needle in l: return i
    return 1

def classify(col):
    typ=col['type'].lower(); name=col['name'].lower()
    if col.get('generated'): origin='Derivado'
    else: origin='Almacenado'
    nature='Temporal' if any(x in name for x in ('date','fecha','time','_at','_on')) or any(x in typ for x in ('date','time','year')) else 'Cuantitativo' if any(x in typ for x in ('int','decimal','numeric','float','double','bit','bool')) else 'Identificador' if name in ('id','key','sku','code','token') or name.endswith('_id') else 'Descriptivo'
    scale='Razón' if nature=='Cuantitativo' else 'Intervalo' if nature=='Temporal' else 'Nominal'
    domain=col.get('enum') or col.get('check') or ('Entero sin signo' if 'unsigned' in typ else 'Valor SQL: '+col['type'])
    return {'values':'Monovalorado (un escalar por fila)','composition':'Simple (columna atómica; no se documenta descomposición semántica adicional)','nature':nature,'scale':scale,'domain':domain,'origin':origin}

tables=[]; table_blocks=[]
for m in re.finditer(r'CREATE TABLE `([^`]+)` \((.*?)\) ENGINE=', SQL, re.S):
    name, body=m.group(1), m.group(2)
    cols=[]; indexes=[]; fks=[]; checks=[]; pk=[]
    for item in split_top(body):
        if item.startswith('`'):
            cm=re.match(r'`([^`]+)`\s+(.+)', item, re.S)
            if not cm: continue
            cn, rest=cm.groups(); typem=re.match(r'(enum\(.*?\)|set\(.*?\)|[a-zA-Z]+(?:\([^)]*\))?(?:\s+unsigned)?(?:\s+zerofill)?)',rest,re.I|re.S)
            typ=typem.group(1) if typem else rest.split()[0]
            defaultm=re.search(r"\bDEFAULT\s+(NULL|CURRENT_TIMESTAMP(?:\(\d+\))?|b'[^']*'|0x[0-9a-fA-F]+|'[^']*'|\"[^\"]*\"|[-+]?\d+(?:\.\d+)?)",rest,re.I)
            enum=re.match(r'(?:enum|set)\((.*)\)',typ,re.I)
            gen=bool(re.search(r'\bGENERATED\s+ALWAYS\s+AS\s*\(',rest,re.I))
            c={'name':cn,'type':typ,'nullable':not bool(re.search(r'\bNOT NULL\b',rest,re.I)), 'default':defaultm.group(1) if defaultm else None,'auto_increment':bool(re.search(r'\bAUTO_INCREMENT\b',rest,re.I)),'on_update':(re.search(r'\bON UPDATE (CURRENT_TIMESTAMP(?:\(\d+\))?)',rest,re.I).group(1) if re.search(r'\bON UPDATE (CURRENT_TIMESTAMP(?:\(\d+\))?)',rest,re.I) else None),'generated':gen,'enum':[x.strip().strip("'") for x in split_top(enum.group(1))] if enum else None,'raw':rest}
            c['classification']=classify(c); cols.append(c)
        else:
            km=re.match(r'(?:CONSTRAINT `([^`]+)`\s+)?(PRIMARY KEY|UNIQUE KEY|KEY|FULLTEXT KEY|SPATIAL KEY|FOREIGN KEY|CHECK)\b(.*)',item,re.S|re.I)
            if not km: continue
            cname,kind,tail=km.groups(); kind=kind.upper()
            if kind=='PRIMARY KEY':
                pk=re.findall(r'`([^`]+)`',tail)
            elif 'KEY' in kind and kind!='FOREIGN KEY':
                idxname=cname
                if not idxname:
                    nm=re.match(r'\s*`([^`]+)`',tail); idxname=nm.group(1) if nm else 'index'
                fields=re.findall(r'`([^`]+)`',tail[tail.find('('):])
                indexes.append({'name':idxname,'kind':'UNIQUE' if 'UNIQUE' in kind else 'INDEX','columns':fields})
                if 'UNIQUE' in kind:
                    for c in cols:
                        if c['name'] in fields: c.setdefault('keys',[]).append('uk')
            elif kind=='FOREIGN KEY':
                fkname=cname or 'fk_'+name
                fm=re.search(r'FOREIGN KEY\s*\((.*?)\)\s*REFERENCES\s*`([^`]+)`\s*\((.*?)\)(.*)',item,re.S|re.I)
                if fm:
                    local=re.findall(r'`([^`]+)`',fm.group(1)); ref=fm.group(2); remote=re.findall(r'`([^`]+)`',fm.group(3)); tail=fm.group(4)
                    fk={'name':fkname,'columns':local,'references':ref+'.'+','.join(remote),'on_delete':(re.search(r'ON DELETE (CASCADE|SET NULL|RESTRICT|NO ACTION)',tail,re.I).group(1).upper() if re.search(r'ON DELETE (CASCADE|SET NULL|RESTRICT|NO ACTION)',tail,re.I) else 'NO ACTION'),'on_update':(re.search(r'ON UPDATE (CASCADE|SET NULL|RESTRICT|NO ACTION)',tail,re.I).group(1).upper() if re.search(r'ON UPDATE (CASCADE|SET NULL|RESTRICT|NO ACTION)',tail,re.I) else 'NO ACTION')}
                    fks.append(fk)
                    for c in cols:
                        if c['name'] in local: c.setdefault('keys',[]).append('fk')
            elif kind=='CHECK': checks.append({'name':cname,'expression':tail.strip()})
    if pk: indexes.insert(0,{'name':'PRIMARY','kind':'PRIMARY','columns':pk})
    for c in cols:
        if c['name'] in pk: c.setdefault('keys',[]).append('pk')
        c['can_omit_on_insert']=bool(c['nullable'] or c['default'] is not None or c['auto_increment'] or c['generated'])
        c['keys']=c.get('keys',[])
    ln=SQL[:m.start()].count('\n')+1
    tables.append({'name':name,'columns':cols,'primary_key':pk,'indexes':indexes,'foreign_keys':fks,'checks':checks,'engine':(re.search(r'ENGINE=([^\s;]+)',SQL[m.end():m.end()+300]).group(1) if re.search(r'ENGINE=([^\s;]+)',SQL[m.end():m.end()+300]) else 'InnoDB'),'line':ln})
    table_blocks.append((name,ln))

triggers=[]
for m in re.finditer(r'/\*!50003 CREATE\*/.*?TRIGGER `([^`]+)` (BEFORE|AFTER) (INSERT|UPDATE|DELETE) ON `([^`]+)` FOR EACH ROW (.*?)END \*/;',SQL,re.S):
    triggers.append({'name':m.group(1),'timing':m.group(2),'event':m.group(3),'table':m.group(4),'body':m.group(5).strip(),'line':SQL[:m.start()].count('\n')+1})
functions=[]; procedures=[]
for m in re.finditer(r'CREATE DEFINER=`[^`]+`@`[^`]+` (FUNCTION|PROCEDURE) `([^`]+)`\s*(\(.*?\))\s*(?:RETURNS\s+([^\n]+))?',SQL,re.S):
    item={'name':m.group(2),'signature':re.sub(r'\s+',' ',m.group(3)).strip(),'returns':(m.group(4) or '').strip(),'line':SQL[:m.start()].count('\n')+1}
    (functions if m.group(1)=='FUNCTION' else procedures).append(item)
views=[]
for m in re.finditer(r'/\*!50001 VIEW `([^`]+)` AS (.*?) \*/;',SQL,re.S):
    name,query=m.group(1),m.group(2)
    # Keep only final, executable view definitions, not temporary placeholders.
    if 'SELECT 1 AS' in query[:40]: continue
    aliases=re.findall(r'\sAS `([^`]+)`',query,re.I)
    exprs={a:e.strip() for e,a in re.findall(r'(.{1,400}?)\s+AS `([^`]+)`',query,re.I)}
    vcols=[]
    for a in aliases:
        ex=exprs.get(a,'')
        comp='Compuesto (expresión SQL)' if re.search(r'\b(?:COALESCE|CONCAT|CASE|CAST|IFNULL)\b|[+*/-]',ex,re.I) else 'Simple (proyección directa)'
        cls=classify({'name':a,'type':'proyectado'})
        cls.update({'values':'Monovalorado por fila devuelta','composition':comp,'domain':'Expresión o columna fuente de la vista','origin':'Proyectado'})
        vcols.append({'name':a,'expression':ex,'classification':cls,'nullable':'Depende de la expresión y de las columnas origen','insert':'No aplica: vista de lectura'})
    views.append({'name':name,'query':query,'columns':aliases,'column_details':vcols,'line':SQL[:m.start()].count('\n')+1})

def domain(t):
    n=t['name']
    if n in ('tb_users','tb_people','tb_user_addresses','tbd_address_components'): return 'Personas y direcciones'
    if n in ('tb_payment_methods','tb_payment_transaction','tb_payments','tbc_payment_methods_types','tbd_user_payment_methods'): return 'Pagos'
    if n in ('tb_products','tbc_categories','tbd_products_categories','tbd_products_users_providers'): return 'Catálogo'
    if n in ('tb_orders','tbd_buyer_orders','tbd_order_items','tb_order_cancellations','tbd_cancellation_items'): return 'Pedidos y cancelaciones'
    if n in ('tb_shipments','tb_returns','tb_refunds','tbd_return_items'): return 'Envíos y devoluciones'
    if n in ('tb_carts','tbd_cart_items','tbd_users_wishlist_products'): return 'Carrito y listas'
    if n in ('tb_logs',): return 'Auditoría'
    return 'Relaciones y catálogo'

allfks=[(t,f) for t in tables for f in t['foreign_keys']]
grouped={}
for t in tables: grouped.setdefault(domain(t),[]).append(t)
domains=list(grouped)
entities=[]; relationships=[]
for ci,d in enumerate(domains):
    for ri,t in enumerate(grouped[d]):
        attrs=[]
        for c in t['columns']:
            shorttype=re.sub(r'^(enum|set)\(.*\)$',r'\1',c['type'],flags=re.I)
            a={'name':c['name'],'type':shorttype}
            k=[x for x in c['keys'] if x in ('pk','fk','uk')]
            if k: a['key']=k[0] if len(k)==1 else k
            fk=next((f for f in t['foreign_keys'] if c['name'] in f['columns']),None)
            if fk:
                ref_table,ref_cols=fk['references'].split('.',1)
                local_cols=fk['columns']; remote_cols=ref_cols.split(',')
                a['references']=ref_table+'.'+remote_cols[local_cols.index(c['name'])]
            attrs.append(a)
        maxname=max((len(a['name']) for a in attrs),default=8); maxtype=max((len(a['type']) for a in attrs),default=8)
        width=min(390,max(260,150+maxname*6+maxtype*5))
        entities.append({'id':t['name'],'label':t['name'],'tag':d,'row':ri,'col':ci,'width':width,'attributes':attrs,'sources':[{'path':SQLPATH.as_posix(),'line':t['line']}]})
for i,(t,f) in enumerate(allfks):
    child=t['name']; parent=f['references'].split('.')[0]
    if parent not in [x['name'] for x in tables]: continue
    if child==parent: continue
    nullable=any(c['name'] in f['columns'] and c['nullable'] for c in t['columns'])
    relationships.append({'id':'rel_'+str(i+1),'from':child,'to':parent,'fromCardinality':'many','toCardinality':'one','fromOptional':True,'toOptional':nullable,'identifying':any(c in t['primary_key'] for c in f['columns'])})
candidate={'schema_version':1,'diagram_type':'erd','meta':{'title':'MERE — db_test · Práctica 03','locale':'es','output':(OUT/ 'mere.html').relative_to(ROOT).as_posix(),'quality_profile':'standard','repository':{'url':ORIGIN,'provider':'github','link_mode':'web','revision':REV},'subtitle':'26 tablas · claves, relaciones y columnas físicas · fuente: respaldo031126.sql'},'layout':{'mode':'grid','gapX':64,'gapY':48},'entities':entities,'relationships':relationships,'cards':[{'dot':'cyan','title':'Lectura de claves y cardinalidad','items':['PK = clave primaria; FK = clave foránea; UK = restricción única. Una tabla hija con muchos registros puede apuntar a una tabla padre.','La opcionalidad de relación se infiere de la nulabilidad de la FK. Las reglas ON DELETE / ON UPDATE y detalles completos están en el diccionario interactivo.']},{'dot':'emerald','title':'Alcance de este MERE','items':['Muestra todas las columnas físicas, con nombre, tipo SQL y papel de clave.','La clasificación semántica, valores predeterminados, inserción, restricciones e índices se consulta en el diccionario de datos.']}]}
(OUT/'candidate.json').write_text(json.dumps(candidate,ensure_ascii=False,indent=2),encoding='utf-8')

data={'database':'db_test','source':SQLPATH.as_posix(),'server':'MySQL 9.3.0 (declarado en mysqldump)','tables':tables,'views':views,'triggers':triggers,'functions':functions,'procedures':procedures,'counts':{'tablas':len(tables),'columnas':sum(len(t['columns']) for t in tables),'vistas':len(views),'triggers':len(triggers),'funciones':len(functions),'procedimientos':len(procedures),'indices':sum(len(t['indexes']) for t in tables),'claves_foraneas':len(allfks)}}
jsondata=json.dumps(data,ensure_ascii=False).replace('</','<\\/')
page='''<!doctype html><html lang="es"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Diccionario de datos — db_test</title><style>
:root{color-scheme:light dark;--bg:#101827;--panel:#192438;--line:#30415c;--fg:#eef4ff;--muted:#a9bad2;--accent:#65d6c4}*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--fg);font:15px/1.5 system-ui,Segoe UI,sans-serif}header{padding:28px max(20px,calc((100vw - 1320px)/2));background:#15243a;border-bottom:1px solid var(--line)}h1,h2,h3{line-height:1.2}h1{margin:0 0 6px}p{color:var(--muted)}main{max-width:1320px;margin:auto;padding:20px}.stats{display:flex;flex-wrap:wrap;gap:10px}.stat,.box,.tablecard{background:var(--panel);border:1px solid var(--line);border-radius:12px;padding:14px}.stat b{display:block;font-size:22px;color:var(--accent)}.toolbar{position:sticky;top:0;background:var(--bg);padding:12px 0;z-index:2;display:flex;gap:8px;flex-wrap:wrap}input,select,button{background:var(--panel);color:var(--fg);border:1px solid var(--line);padding:9px 12px;border-radius:8px}input{flex:1;min-width:220px}details{margin:10px 0}.tablecard summary{cursor:pointer;font-weight:700;font-size:17px}.tablemeta{color:var(--muted);font-size:13px;margin:8px 0}table{width:100%;border-collapse:collapse;display:block;overflow:auto;margin:10px 0}td,th{text-align:left;padding:8px;border-bottom:1px solid var(--line);vertical-align:top}th{color:var(--accent);position:sticky;top:0;background:var(--panel)}.pill{border:1px solid var(--line);border-radius:99px;padding:2px 7px;font-size:12px;white-space:nowrap}code{color:#b6e4ff;overflow-wrap:anywhere}.objgrid{display:grid;grid-template-columns:repeat(auto-fit,minmax(280px,1fr));gap:10px}.box h3{margin-top:0}.small{font-size:13px;color:var(--muted)}a{color:var(--accent)}.gloss{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:8px}footer{max-width:1320px;margin:auto;padding:20px;color:var(--muted)}
</style><header><h1>Diccionario de datos · db_test</h1><div>Práctica 03 · Fuente definitiva: <code>Practica03/backups/respaldo031126.sql</code> · MySQL 9.3.0</div><p>Generado desde DDL del respaldo. La fuente es un snapshot; no se consultó una instancia activa. <a href="mere.html">Abrir MERE interactivo (Archify) ↗</a></p><div id="stats" class="stats"></div></header><main><section class="box"><h2>Cómo leer la clasificación</h2><p>El campo SQL es escalar por fila (monovalorado) y simple porque la columna almacena un solo valor. Naturaleza y escala se infieren del nombre y tipo SQL; dominio se toma de ENUM/SET o CHECK cuando existe; de otro modo se expresa el tipo SQL y sus límites físicos. “Almacenado/derivado” describe columnas físicas y expresiones GENERATE; los campos de vistas son proyectados o calculados. No se atribuyen reglas del negocio que el DDL no declare.</p><div class="gloss"><div><b>NULL</b>: permitido por la columna si no declara NOT NULL.</div><div><b>Omitible al insertar</b>: sí si admite NULL, tiene DEFAULT, AUTO_INCREMENT o es generado.</div><div><b>PK/FK/UK</b>: primaria / foránea / única.</div><div><b>Escalas</b>: nominal (categorías), ordinal (orden), intervalo (diferencias), razón (cero significativo).</div><div><b>Proyectado</b>: columna presentada por una VIEW; puede combinar/cambiar datos.</div><div><b>Índice</b>: estructura para unicidad o búsqueda, no garantiza por sí misma semántica adicional.</div></div></section><div class="toolbar"><input id="q" placeholder="Buscar tabla, campo, tipo, clave, vista, rutina…"><select id="kind"><option value="all">Todos los objetos</option><option value="tables">Tablas</option><option value="views">Vistas</option><option value="routines">Rutinas</option><option value="triggers">Triggers</option></select><button id="expand">Expandir tablas</button><button id="collapse">Contraer tablas</button></div><section id="content"></section><section class="box"><h2>Ejemplos sencillos</h2><ul><li>Si <code>tb_users.ID</code> es AUTO_INCREMENT, puede omitirse al insertar y MySQL asigna la clave.</li><li>Si una columna indica NULL y no tiene DEFAULT, se puede omitir; su valor queda NULL.</li><li>Una FK <code>user_ID → tb_users.ID</code> exige que el padre exista cuando no admite NULL.</li><li>Una vista que presenta <code>precio * cantidad</code> muestra un valor proyectado/calculado; no equivale a una columna persistida.</li></ul></section></main><footer>Clasificación semántica orientativa y determinista a partir de DDL; confirmar con reglas de negocio cuando el esquema no las expresa.</footer><script>
const D=DATA_PLACEHOLDER;const esc=s=>String(s??'—').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
document.querySelector('#stats').innerHTML=Object.entries(D.counts).map(([k,v])=>`<div class="stat"><b>${v}</b>${esc(k.replaceAll('_',' '))}</div>`).join('');
function fieldRow(t,c){let flags=[...(c.keys||[]).map(k=>k.toUpperCase()),c.nullable?'NULL':'NOT NULL',c.can_omit_on_insert?'Omitible':'Requerido'];return `<tr><td><code>${esc(c.name)}</code></td><td>${esc(c.type)}</td><td>${flags.map(x=>`<span class="pill">${esc(x)}</span>`).join(' ')}</td><td>${esc(c.default??'—')}</td><td>${esc(c.on_update??'—')}</td><td>${esc(c.classification.values)}; ${esc(c.classification.composition)}</td><td>${esc(c.classification.nature)} / ${esc(c.classification.scale)}</td><td>${esc(c.enum?.join(', ')||c.classification.domain)}</td><td>${esc(c.generated?'Derivado':'Almacenado')}</td></tr>`}
function render(){let q=document.querySelector('#q').value.toLowerCase(),k=document.querySelector('#kind').value,parts=[];if(k==='all'||k==='tables')parts.push(`<h2>Tablas y campos</h2>`+D.tables.filter(t=>JSON.stringify(t).toLowerCase().includes(q)).map(t=>`<details class="tablecard" open><summary>${esc(t.name)} <span class="pill">${t.columns.length} campos</span> <span class="pill">PK (${esc(t.primary_key.join(', ')||'—')})</span></summary><div class="tablemeta">${esc(t.engine)} · DDL línea ${t.line} · FKs: ${t.foreign_keys.length} · Índices: ${t.indexes.length}</div><table><thead><tr><th>Campo</th><th>Tipo SQL</th><th>Claves / NULL / inserción</th><th>DEFAULT</th><th>ON UPDATE</th><th>Cantidad / composición</th><th>Naturaleza / escala</th><th>Dominio</th><th>Origen</th></tr></thead><tbody>${t.columns.map(c=>fieldRow(t,c)).join('')}</tbody></table><h3>Claves foráneas y reglas</h3><ul>${t.foreign_keys.map(f=>`<li><code>${esc(f.name)}</code>: (${esc(f.columns.join(', '))}) → <code>${esc(f.references)}</code>; DELETE ${esc(f.on_delete)}, UPDATE ${esc(f.on_update)}</li>`).join('')||'<li>Sin claves foráneas</li>'}</ul><h3>Índices</h3><ul>${t.indexes.map(i=>`<li>${esc(i.kind)} <code>${esc(i.name)}</code> (${esc(i.columns.join(', '))})</li>`).join('')||'<li>Solo clave primaria/no hay índices secundarios</li>'}</ul>${t.checks.length?`<h3>CHECK</h3><ul>${t.checks.map(c=>`<li><code>${esc(c.name||'CHECK')}</code> ${esc(c.expression)}</li>`).join('')}</ul>`:''}</details>`).join(''));
if(k==='all'||k==='views')parts.push(`<h2>Vistas (${D.views.length})</h2><div class="objgrid">${D.views.filter(x=>JSON.stringify(x).toLowerCase().includes(q)).map(v=>`<details class="box"><summary><code>${esc(v.name)}</code></summary><p>Campos proyectados; NULL y tipo SQL dependen de la expresión fuente.</p><table><thead><tr><th>Campo</th><th>Expresión</th><th>Clasificación</th><th>Origen</th><th>NULL / inserción</th></tr></thead><tbody>${v.column_details.map(c=>`<tr><td><code>${esc(c.name)}</code></td><td><code>${esc(c.expression)}</code></td><td>${esc(c.classification.values)}; ${esc(c.classification.composition)}; ${esc(c.classification.nature)} / ${esc(c.classification.scale)}; ${esc(c.classification.domain)}</td><td>${esc(c.classification.origin)}</td><td>${esc(c.nullable)}; ${esc(c.insert)}</td></tr>`).join('')}</tbody></table><p class="small">Definición SQL extraída (truncada a 1200 caracteres):</p><code>${esc(v.query.slice(0,1200))}</code></details>`).join('')}</div>`);
if(k==='all'||k==='triggers')parts.push(`<h2>Triggers (${D.triggers.length})</h2><div class="objgrid">${D.triggers.filter(x=>JSON.stringify(x).toLowerCase().includes(q)).map(t=>`<details class="box"><summary><code>${esc(t.name)}</code> · ${esc(t.timing)} ${esc(t.event)} → ${esc(t.table)}</summary><p class="small">Línea ${t.line}</p><code>${esc(t.body)}</code></details>`).join('')}</div>`);
if(k==='all'||k==='routines')parts.push(`<h2>Funciones (${D.functions.length})</h2><div class="objgrid">${D.functions.filter(x=>JSON.stringify(x).toLowerCase().includes(q)).map(x=>`<div class="box"><b><code>${esc(x.name)}</code></b><p><code>${esc(x.signature)}</code> → ${esc(x.returns)}</p><span class="small">DDL línea ${x.line}</span></div>`).join('')}</div><h2>Procedimientos (${D.procedures.length})</h2><div class="objgrid">${D.procedures.filter(x=>JSON.stringify(x).toLowerCase().includes(q)).map(x=>`<div class="box"><b><code>${esc(x.name)}</code></b><p><code>${esc(x.signature)}</code></p><span class="small">DDL línea ${x.line}</span></div>`).join('')}</div>`);document.querySelector('#content').innerHTML=parts.join('')||'<p>Sin coincidencias</p>'}
document.querySelector('#q').oninput=render;document.querySelector('#kind').onchange=render;document.querySelector('#expand').onclick=()=>document.querySelectorAll('details.tablecard').forEach(x=>x.open=true);document.querySelector('#collapse').onclick=()=>document.querySelectorAll('details.tablecard').forEach(x=>x.open=false);render();
</script></html>'''.replace('DATA_PLACEHOLDER',jsondata)
(OUT/'diccionario-datos.html').write_text(page,encoding='utf-8')
print(json.dumps(data['counts'],ensure_ascii=False))
