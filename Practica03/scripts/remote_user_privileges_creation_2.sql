USE `db_test`;

-- ==============================================================================
-- 1. CREACIÓN DE USUARIOS REMOTOS ('%')
-- ==============================================================================
CREATE USER IF NOT EXISTS 'pablo.reyes'@'%' IDENTIFIED BY '240148';
CREATE USER IF NOT EXISTS 'marco.ramirez'@'%' IDENTIFIED BY 'qwerty123';
CREATE USER IF NOT EXISTS 'adrian.rios'@'%' IDENTIFIED BY '240165';
CREATE USER IF NOT EXISTS 'carlos.rene'@'%' IDENTIFIED BY '240221';
CREATE USER IF NOT EXISTS 'uriel.perez'@'%' IDENTIFIED BY '240485';
CREATE USER IF NOT EXISTS 'luis.cazarez'@'%' IDENTIFIED BY '240343';
CREATE USER IF NOT EXISTS 'saul.barrios'@'%' IDENTIFIED BY '240196';
CREATE USER IF NOT EXISTS 'app_movil'@'%' IDENTIFIED BY 'Mobile890';
CREATE USER IF NOT EXISTS 'app_web'@'%' IDENTIFIED BY 'Web123';

-- Privilegio raíz global a superusuario principal
GRANT ALL PRIVILEGES ON *.* TO 'pablo.reyes'@'%' WITH GRANT OPTION;

-- ==============================================================================
-- 2. CREACIÓN DE LOS 7 ROLES DEL SISTEMA
-- ==============================================================================
CREATE ROLE IF NOT EXISTS 'superadmin';
CREATE ROLE IF NOT EXISTS 'admin';
CREATE ROLE IF NOT EXISTS 'support';
CREATE ROLE IF NOT EXISTS 'seller';
CREATE ROLE IF NOT EXISTS 'buyer';
CREATE ROLE IF NOT EXISTS 'common_user';
CREATE ROLE IF NOT EXISTS 'user_not_registered';

-- ==============================================================================
-- 3. ASIGNACIÓN DE PRIVILEGIOS A CADA ROL
-- ==============================================================================

-- ROL 1: superadmin (Acceso y control global)
GRANT ALL PRIVILEGES ON *.* TO 'superadmin' WITH GRANT OPTION;

-- ROL 2: admin (Control DML total sobre la base de datos db_test)
GRANT ALL PRIVILEGES ON `db_test`.* TO 'admin';

-- ROL 3: support (Soporte, lectura global de auditoría/tablas y actualización de usuarios/órdenes/categorías)
GRANT SELECT ON `db_test`.* TO 'support';
GRANT INSERT, UPDATE ON `db_test`.`tb_users` TO 'support';
GRANT UPDATE ON `db_test`.`tb_products` TO 'support';
GRANT INSERT, UPDATE ON `db_test`.`tbc_categories` TO 'support';
GRANT INSERT, UPDATE ON `db_test`.`tbd_products_categories` TO 'support';
GRANT UPDATE ON `db_test`.`tb_orders` TO 'support';
GRANT UPDATE ON `db_test`.`tb_returns` TO 'support';
GRANT UPDATE ON `db_test`.`tb_order_cancellations` TO 'support';
GRANT EXECUTE ON PROCEDURE `db_test`.`sp_soft_delete_user` TO 'support';

-- ROL 4: seller (Vendedores remotos: productos, inventario, categorías, órdenes de venta y envíos)
GRANT SELECT, INSERT, UPDATE, DELETE ON `db_test`.`tb_products` TO 'seller';
GRANT SELECT ON `db_test`.`tbc_categories` TO 'seller';
GRANT SELECT, INSERT, UPDATE, DELETE ON `db_test`.`tbd_products_categories` TO 'seller';
GRANT SELECT, INSERT, UPDATE, DELETE ON `db_test`.`tbd_products_users_providers` TO 'seller';
GRANT SELECT, INSERT, UPDATE ON `db_test`.`tbd_buyer_orders` TO 'seller';
GRANT SELECT, INSERT, UPDATE ON `db_test`.`tbd_order_items` TO 'seller';
GRANT SELECT, INSERT, UPDATE ON `db_test`.`tb_shipments` TO 'seller';
GRANT SELECT ON `db_test`.`vw_productos_por_categoria` TO 'seller';

-- ROL 5: buyer (Compradores: catálogo, carritos, órdenes, direcciones, métodos de pago y wishlist)
GRANT SELECT ON `db_test`.`tb_products` TO 'buyer';
GRANT SELECT ON `db_test`.`tbc_categories` TO 'buyer';
GRANT SELECT ON `db_test`.`vw_productos_por_categoria` TO 'buyer';
GRANT SELECT, INSERT, UPDATE, DELETE ON `db_test`.`tb_carts` TO 'buyer';
GRANT SELECT, INSERT, UPDATE, DELETE ON `db_test`.`tbd_cart_items` TO 'buyer';
GRANT SELECT, INSERT ON `db_test`.`tb_orders` TO 'buyer';
GRANT SELECT, INSERT ON `db_test`.`tbd_buyer_orders` TO 'buyer';
GRANT SELECT, INSERT, UPDATE ON `db_test`.`tbd_order_items` TO 'buyer';
GRANT SELECT, INSERT, UPDATE, DELETE ON `db_test`.`tbd_users_wishlist_products` TO 'buyer';
GRANT SELECT, INSERT, UPDATE, DELETE ON `db_test`.`tb_user_addresses` TO 'buyer';
GRANT SELECT, INSERT, UPDATE, DELETE ON `db_test`.`tbd_user_payment_methods` TO 'buyer';
GRANT SELECT, INSERT ON `db_test`.`tb_payments` TO 'buyer';

-- ROL 6: common_user (Usuario registrado básico: lectura de catálogo y perfil propio)
GRANT SELECT ON `db_test`.`tb_products` TO 'common_user';
GRANT SELECT ON `db_test`.`tbc_categories` TO 'common_user';
GRANT SELECT ON `db_test`.`vw_productos_por_categoria` TO 'common_user';
GRANT SELECT, UPDATE ON `db_test`.`tb_users` TO 'common_user';
GRANT SELECT, UPDATE ON `db_test`.`tb_people` TO 'common_user';
GRANT SELECT, INSERT, UPDATE, DELETE ON `db_test`.`tbd_users_wishlist_products` TO 'common_user';

-- ROL 7: user_not_registered (Usuario no registrado / Invitado)
GRANT SELECT ON `db_test`.`vw_productos_por_categoria` TO 'user_not_registered';
GRANT SELECT ON `db_test`.`tbc_categories` TO 'user_not_registered';
GRANT SELECT (ID, SKU, name, description, current_price, current_stock, status) ON `db_test`.`tb_products` TO 'user_not_registered';

-- ==============================================================================
-- 4. ASIGNACIÓN DE ROLES A LAS CUENTAS DE USUARIO
-- ==============================================================================
GRANT 'superadmin' TO 'pablo.reyes'@'%';
GRANT 'admin' TO 'marco.ramirez'@'%';
GRANT 'support' TO 'adrian.rios'@'%';
GRANT 'seller' TO 'carlos.rene'@'%', 'luis.cazarez'@'%';
GRANT 'buyer' TO 'uriel.perez'@'%', 'saul.barrios'@'%';
GRANT 'user_not_registered', 'common_user', 'buyer' TO 'app_movil'@'%', 'app_web'@'%';

-- ==============================================================================
-- 5. ACTIVACIÓN DE ROLES PREDETERMINADOS (SET DEFAULT ROLE ALL)
-- ==============================================================================
SET DEFAULT ROLE 'superadmin' TO 'pablo.reyes'@'%';
SET DEFAULT ROLE 'admin' TO 'marco.ramirez'@'%';
SET DEFAULT ROLE 'support' TO 'adrian.rios'@'%';
SET DEFAULT ROLE 'seller' TO 'carlos.rene'@'%';
SET DEFAULT ROLE 'seller' TO 'luis.cazarez'@'%';
SET DEFAULT ROLE 'user_not_registered' TO 'app_movil'@'%', 'app_web'@'%';

FLUSH PRIVILEGES;

SELECT "Los usuarios y privilegios han sido creados correctamente" AS mensaje;