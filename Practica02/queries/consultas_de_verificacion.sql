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

/*6.Verificar que los usuarios remotos hayan sido creados*/
SELECT User, Host FROM mysql.user WHERE Host = '%' AND account_locked = 'N';

/*7. Verificar los roles que fueron creados */
SELECT User, Host FROM mysql.user WHERE Host = '%' AND account_locked = 'Y';

/*8. Verificar que usuarios tienen que roles */