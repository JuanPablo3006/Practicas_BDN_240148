-- 1. ¿Cuántas tablas existen en la base de datos actual?
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' AND table_type = 'BASE TABLE';


-- 2. ¿Cuántos triggers existen en la base de datos?
SELECT trigger_name, event_object_table 
FROM information_schema.triggers;


-- 3. Total y visualización de registros en la tabla de usuarios
SELECT COUNT(*) AS total_registros FROM tb_users;
SELECT * FROM tb_users;


-- 4. Verificar los usuarios de la base de datos (con acceso remoto/login) y sus roles asignados
SELECT 
    u.usename AS usuario,
    r.rolname AS rol_asignado
FROM pg_user u
LEFT JOIN pg_auth_members m ON u.usesysid = m.member
LEFT JOIN pg_roles r ON m.roleid = r.oid;


-- 5. Total de registros en la bitácora / logs
SELECT COUNT(*) AS total_registros FROM tb_logs;


-- 6. Consultar todas las operaciones realizadas registradas en la bitácora
SELECT * FROM tb_logs;


-- 7. Verificar que los usuarios remotos con acceso hayan sido creados
SELECT usename AS usuario, valuntil AS expiracion 
FROM pg_user 
WHERE usename IN ('pablo_reyes', 'marco_ramirez', 'carlos_rene', 'uriel_perez', 'luis_cazarez', 'saul_barrios', 'johny_neri');


-- 8. Verificar los roles del sistema que fueron creados
SELECT rolname AS rol 
FROM pg_roles 
WHERE rolname IN ('superadmin', 'admin', 'seller', 'buyer', 'support', 'common', 'not_registered');


-- 9. Verificar el total de funciones almacenadas en la base de datos
SELECT routine_name 
FROM information_schema.routines 
WHERE routine_schema = 'public';


-- 10. Verificación y contabilización de productos
SELECT COUNT(*) AS total_productos FROM tb_products;
SELECT * FROM tb_products;


-- 11. Trazabilidad de productos (Consultando la vista correspondiente)
SELECT * FROM vw_trazabilidad_productos ORDER BY operation_date DESC LIMIT 10;


-- 12. Trazabilidad de usuarios (Consultando la vista correspondiente)
SELECT * FROM vw_trazabilidad_usuarios ORDER BY operation_date ASC;