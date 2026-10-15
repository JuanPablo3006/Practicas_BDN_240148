/* CREACION DE USUARIOS REMOTOS (Seguro si ya existen) */

CREATE USER IF NOT EXISTS 'pablo.reyes'@'%' IDENTIFIED BY '240148';
CREATE USER IF NOT EXISTS 'marco.ramirez'@'%' IDENTIFIED BY 'qwerty123';
CREATE USER IF NOT EXISTS 'adrian.rios'@'%' IDENTIFIED BY '240165';
CREATE USER IF NOT EXISTS 'carlos.rene'@'%' IDENTIFIED BY '240221';
CREATE USER IF NOT EXISTS 'uriel.perez'@'%' IDENTIFIED BY '240485';
CREATE USER IF NOT EXISTS 'luis.cazarez'@'%' IDENTIFIED BY '240343';
CREATE USER IF NOT EXISTS 'saul.barrios'@'%' IDENTIFIED BY '240196';

/* ASIGNACION DE PRIVILEGIOS DEL SUPER USUARIO CORREGIDO */
GRANT ALL PRIVILEGES ON *.* TO 'pablo.reyes'@'%' WITH GRANT OPTION;

/* CREACION DE ROLES PARA LOS USUARIOS DE LA PLATAFORMA DE ECOMMERCE */
CREATE ROLE IF NOT EXISTS 'superadmin';
CREATE ROLE IF NOT EXISTS 'admin';
CREATE ROLE IF NOT EXISTS 'seller';
CREATE ROLE IF NOT EXISTS 'buyer';
CREATE ROLE IF NOT EXISTS 'common_user';
CREATE ROLE IF NOT EXISTS 'user_not_registered';
CREATE ROLE IF NOT EXISTS 'support';

/* ASIGNACION DE PRIVILEGIOS A LOS ROLES DE LA PLATAFORMA ECOMMERCE */
-- ADMIN
/* SUPERADMIN CORREGIDO */
GRANT ALL PRIVILEGES ON *.* TO 'superadmin';
/* ADMIN */
GRANT ALL PRIVILEGES ON db_test.* TO 'admin';
/* SUPPORT */
GRANT SELECT, INSERT, UPDATE ON db_test.tb_users TO 'support';
GRANT SELECT, UPDATE ON db_test.tb_products TO 'support';
GRANT SELECT, INSERT, UPDATE ON db_test.tbc_categories TO 'support';
GRANT SELECT, INSERT, UPDATE ON db_test.tbd_products_categories TO 'support';
GRANT EXECUTE ON PROCEDURE db_test.sp_soft_delete_user TO 'support'@'%';
/* SELLER */
GRANT SELECT, INSERT, UPDATE ON db_test.tb_products TO 'seller';
GRANT SELECT ON db_test.tbc_categories TO 'seller';
/*BUYER*/
GRANT SELECT, INSERT, UPDATE ON db_test.tb_carts TO 'buyer';
GRANT SELECT, INSERT, UPDATE ON db_test.tbd_carts_items TO 'buyer';
GRANT SELECT, INSERT ON db_test.tb_buyer_orders TO 'buyer';
GRANT SELECT, INSERT, UPDATE ON db_test.tbd_users_wishlist_products TO 'buyer';

/* ASIGNAR EL ROL AL USUARIO */
/* Super admin*/
GRANT 'superadmin' TO 'pablo.reyes'@'%';
GRANT 'admin' TO 'marco.ramirez'@'%';
GRANT 'support' TO 'adrian.rios'@'%';
GRANT 'seller' TO 'carlos.rene'@'%';
GRANT 'seller' TO 'luis.cazarez'@'%';

/* Esto permite que el rol se active automaticamente cuando el usuario inicia sesion */
SET DEFAULT ROLE 'superadmin' TO 'pablo.reyes'@'%';
SET DEFAULT ROLE 'admin' TO 'marco.ramirez'@'%';
SET DEFAULT ROLE 'support' TO 'adrian.rios'@'%';
SET DEFAULT ROLE 'seller' TO 'carlos.rene'@'%';
SET DEFAULT ROLE 'seller' TO 'luis.cazarez'@'%';

-- 7. REFRESCAR PRIVILEGIOS Y MENSAJE DE CONFIRMACION
FLUSH PRIVILEGES;

SELECT "Los usuarios y privilegios han sido creados correctamente" AS mensaje;