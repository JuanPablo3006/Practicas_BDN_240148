/* Consultar los triggers que hay en la base de datos*/
show triggers from db_test;

SELECT user,host FROM mysql.user WHERE host="%";

SELECT
	FROM_USER AS Rol,
    FROM_HOST AS Host_Rol,
    TO_USER AS Usuario,
    TO_HOST AS Host_Usuario
FROM mysql.role_edges
ORDER BY FROM_USER, TO_USER;

/*Join*/
SELECT   u.nickname, u.email, b.db_user AS inserted_by,
        GROUP_CONCAT(    DISTINCT re.FROM_USER  ORDER BY re.FROM_USER  SEPARATOR ', ' ) AS roles,
        b.description, b.operation_date
FROM tb_users u
JOIN tb_logs b
    ON b.description LIKE CONCAT('%', u.nickname, '%')
    AND b.description LIKE CONCAT('%', u.email, '%')
LEFT JOIN mysql.role_edges re
    ON re.TO_USER = SUBSTRING_INDEX(b.db_user, '@', 1)
WHERE b.operation = 'Create'
    AND b.table_name = 'tb_users'
GROUP BY u.nickname, u.email, b.db_user, b.description, b.operation_date
ORDER BY b.operation_date asc;

/*4. Cuantos registros existen en la tabla bitacora) */
SELECT COUNT(*) AS total_registros FROM tb_logs;

/*5. Consultar todas las operaciones realizadas en la base de datos*/
SELECT * FROM tb_logs;

/*6.Verificar que los usuarios remotos hayan sido creados*/
SELECT User, Host FROM mysql.user WHERE Host = '%' AND account_locked = 'N';

/*7. Verificar los roles que fueron creados */
SELECT User, Host FROM mysql.user WHERE Host = '%' AND account_locked = 'Y';

/*8. Verificar que usuarios tienen que roles */
SELECT TO_USER AS usuario, TO_HOST AS host, FROM_USER AS rol, FROM_HOST AS rol_host
FROM mysql.role_edges ORDER BY TO_USER, FROM_USER, ROL;

/*9. Verificar el total de procedimientos almacenados que existen en la base de datos db_test */
SHOW PROCEDURE STATUS WHERE Db = 'db_test';

/*10. Verificacion de Productos*/
/*Contabilizar los productos*/
SELECT COUNT(*) FROM tb_products;

/*Visualizar todos los productos*/
SELECT * FROM tb_products;

/* Consulta para saber la trazabilidad de los productos*/
SELECT * FROM vw_trazabilidad_productos ORDER BY operation_date DESC LIMIT 10;

/*Consulta la trazabilidad de usuarios*/
SELECT * FROM vw_trazabilidad_usuarios ORDER BY operation_date ASC;