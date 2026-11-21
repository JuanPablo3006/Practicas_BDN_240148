# Práctica 04 · Base de datos `db_test`

## Documentación interactiva

**[Abrir diccionario de datos y MERE de Práctica 04 en GitHub Pages](https://juanpablo3006.github.io/Practicas_BDN_240148/Practica04/docs/)**

El sitio estático se encuentra en [`docs/`](docs/). Incluye búsqueda por nombre, filtro por prefijo, diccionario de campos, vistas, triggers, rutinas y el modelo entidad-relación interactivo. Selecciona una entidad en el MERE para ver su categoría, conteo de registros y enlace al diccionario.

## Resumen del respaldo

Fuente única del esquema y de los conteos: [`backups/respaldo181126.sql`](backups/respaldo181126.sql), snapshot de `db_test` (MySQL 9.3.0 indicado por el dump).

| Métrica | Total |
|---|---:|
| Tablas | 26 (2 catálogos `tbc_*`, 14 principales `tb_*`, 10 detalle/relación `tbd_*`) |
| Registros incluidos en sentencias `INSERT` | 115,934 |
| Vistas `vw_*` | 26 |
| Triggers `trg_*` | 75 |
| Procedimientos almacenados | 5 |
| Funciones | 7 |
| Procedimientos y funciones | 12 |

Los conteos de registros se obtuvieron contando las tuplas de cada `INSERT ... VALUES` del respaldo; no representan una consulta a una instancia activa. La página muestra el total exacto por tabla.

## Casos de prueba documentados

Las consultas de verificación describen cinco flujos de negocio:

1. **Compra multiproveedor con pago único:** pedido distribuido en cinco subórdenes, pago Visa y envíos entregados.
2. **Pagos parciales y devolución:** compra multiproveedor con cinco pagos completados, devolución de producto dañado y envío de reposición.
3. **Cancelación parcial:** cancelación de una partida antes del envío, reembolso parcial y entrega de las partidas restantes.
4. **Pago en efectivo y recolección:** pedido pagado en efectivo y entregado mediante modalidad *Pickup Point*.
5. **Falta de inventario y cupón:** pago fallido por falta de stock, cancelación del pedido, liberación/reasignación del cupón y verificación de que el inventario no se consumió.

Las consultas de verificación se encuentran en [`queries/consultas_de_verificacion.sql`](queries/consultas_de_verificacion.sql). Para consultar los eventos auditados de cada flujo desde `tb_logs`, [`queries/vistas_casos_practica04.sql`](queries/vistas_casos_practica04.sql) crea las vistas `vw_practica04_caso_1` a `vw_practica04_caso_5`; [`queries/consulta_5_casos.sql`](queries/consulta_5_casos.sql) contiene una consulta por vista para abrir los cinco resultados en MySQL Workbench.

## Estructura

- `backups/respaldo181126.sql`: snapshot SQL documentado.
- `queries/`: consultas de verificación del esquema y de los cinco casos.
- `scripts/`: scripts de creación de usuarios y privilegios remotos.
- `seeds/`: datos de semilla de la práctica.
- `.archify/erd-db-test-practica04-20261119/`: candidato ERD y generador de la documentación.
- `docs/index.html`: diccionario de datos y documentación de objetos SQL.
- `docs/mere.html`: MERE navegable con enlaces al diccionario.

