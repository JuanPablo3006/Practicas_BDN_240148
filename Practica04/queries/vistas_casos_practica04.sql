USE `db_test`;

-- Caso 1: compra multiproveedor, pago Visa y cinco entregas (usuario 7501, órdenes 1-2).
CREATE OR REPLACE VIEW `vw_practica04_caso_1` AS
SELECT
    'Caso 1 - Compra exitosa' AS `caso`,
    CASE
        WHEN l.`table_name` IN ('tb_users', 'tb_people', 'tb_user_addresses') THEN 'Registro'
        WHEN l.`table_name` IN ('tb_carts', 'tbd_cart_items') THEN 'Carrito'
        WHEN l.`table_name` IN ('tb_orders', 'tbd_buyer_orders', 'tbd_order_items') THEN 'Compra'
        WHEN l.`table_name` IN ('tb_payments', 'tb_payment_transaction', 'tb_payment_methods', 'tbd_user_payment_methods') THEN 'Pago'
        WHEN l.`table_name` = 'tb_shipments' THEN 'Envío'
        ELSE 'Otro'
    END AS `fase`,
    CASE
        WHEN l.`table_name` = 'tb_users' AND l.`operation` = 'Create' THEN 'user_not_registered'
        WHEN SUBSTRING_INDEX(l.`db_users`, '@', 1) IN ('pablo.reyes', 'root') THEN 'superadmin'
        ELSE 'common'
    END AS `rol`,
    SUBSTRING_INDEX(l.`db_users`, '@', 1) AS `usuario_ejecutor`,
    l.`db_users` AS `conexion_bd`,
    l.`operation_date` AS `fecha_evento`,
    l.`table_name` AS `tabla_modificada`,
    l.`operation` AS `operacion`,
    l.`description` AS `detalle_evento`,
    'Evento registrado' AS `resultado`
FROM `tb_logs` AS l
WHERE l.`operation_date` >= '2026-11-07 20:00:00'
  AND l.`operation_date` <  '2026-11-07 21:00:00'
  AND l.`table_name` IN ('tb_users','tb_people','tb_user_addresses','tb_carts','tbd_cart_items','tb_orders','tbd_buyer_orders','tbd_order_items','tb_payments','tb_payment_transaction','tb_shipments');

-- Caso 2: cinco pagos completados, devolución por daño y reposición (usuario 7292, orden 3).
CREATE OR REPLACE VIEW `vw_practica04_caso_2` AS
SELECT
    'Caso 2 - Pagos parciales y devolución' AS `caso`,
    CASE
        WHEN l.`table_name` IN ('tb_users', 'tb_people', 'tb_user_addresses') THEN 'Registro'
        WHEN l.`table_name` IN ('tb_carts', 'tbd_cart_items') THEN 'Carrito'
        WHEN l.`table_name` IN ('tb_orders', 'tbd_buyer_orders', 'tbd_order_items') THEN 'Compra'
        WHEN l.`table_name` IN ('tb_payments', 'tb_payment_transaction', 'tb_payment_methods', 'tbd_user_payment_methods') THEN 'Pago'
        WHEN l.`table_name` IN ('tb_returns', 'tbd_return_items') THEN 'Devolución'
        WHEN l.`table_name` = 'tb_shipments' THEN 'Envío'
        ELSE 'Otro'
    END AS `fase`,
    CASE
        WHEN l.`table_name` = 'tb_users' AND l.`operation` = 'Create' THEN 'user_not_registered'
        WHEN SUBSTRING_INDEX(l.`db_users`, '@', 1) IN ('pablo.reyes', 'root') THEN 'superadmin'
        ELSE 'common'
    END AS `rol`,
    SUBSTRING_INDEX(l.`db_users`, '@', 1) AS `usuario_ejecutor`,
    l.`db_users` AS `conexion_bd`,
    l.`operation_date` AS `fecha_evento`,
    l.`table_name` AS `tabla_modificada`,
    l.`operation` AS `operacion`,
    l.`description` AS `detalle_evento`,
    'Evento registrado' AS `resultado`
FROM `tb_logs` AS l
WHERE l.`operation_date` >= '2026-11-17 13:10:00'
  AND l.`operation_date` <  '2026-11-17 14:30:00'
  AND l.`table_name` IN ('tb_users','tb_people','tb_user_addresses','tb_carts','tbd_cart_items','tb_orders','tbd_buyer_orders','tbd_order_items','tb_payments','tb_payment_transaction','tb_returns','tbd_return_items','tb_shipments');

-- Caso 3: cancelación parcial, reembolso y entrega del resto (usuario 2, orden 4).
CREATE OR REPLACE VIEW `vw_practica04_caso_3` AS
SELECT
    'Caso 3 - Cancelación parcial y reembolso' AS `caso`,
    CASE
        WHEN l.`table_name` IN ('tb_users', 'tb_people', 'tb_user_addresses') THEN 'Registro'
        WHEN l.`table_name` IN ('tb_carts', 'tbd_cart_items') THEN 'Carrito'
        WHEN l.`table_name` IN ('tb_orders', 'tbd_buyer_orders', 'tbd_order_items') THEN 'Compra'
        WHEN l.`table_name` IN ('tb_payments', 'tb_payment_transaction', 'tb_payment_methods', 'tbd_user_payment_methods') THEN 'Pago'
        WHEN l.`table_name` IN ('tb_order_cancellations', 'tbd_cancellation_items') THEN 'Cancelación'
        WHEN l.`table_name` = 'tb_refunds' THEN 'Reembolso'
        WHEN l.`table_name` = 'tb_shipments' THEN 'Envío'
        ELSE 'Otro'
    END AS `fase`,
    CASE
        WHEN l.`table_name` = 'tb_users' AND l.`operation` = 'Create' THEN 'user_not_registered'
        WHEN SUBSTRING_INDEX(l.`db_users`, '@', 1) IN ('pablo.reyes', 'root') THEN 'superadmin'
        ELSE 'common'
    END AS `rol`,
    SUBSTRING_INDEX(l.`db_users`, '@', 1) AS `usuario_ejecutor`,
    l.`db_users` AS `conexion_bd`,
    l.`operation_date` AS `fecha_evento`,
    l.`table_name` AS `tabla_modificada`,
    l.`operation` AS `operacion`,
    l.`description` AS `detalle_evento`,
    'Evento registrado' AS `resultado`
FROM `tb_logs` AS l
WHERE l.`operation_date` >= '2026-11-17 18:45:00'
  AND l.`operation_date` <  '2026-11-17 19:35:00'
  AND l.`table_name` IN ('tb_users','tb_people','tb_user_addresses','tb_carts','tbd_cart_items','tb_orders','tbd_buyer_orders','tbd_order_items','tb_payments','tb_payment_transaction','tb_order_cancellations','tbd_cancellation_items','tb_refunds','tb_shipments');

-- Caso 4: pago en efectivo y entrega Pickup Point (usuario 10, orden 5).
CREATE OR REPLACE VIEW `vw_practica04_caso_4` AS
SELECT
    'Caso 4 - Pago en efectivo y recolección' AS `caso`,
    CASE
        WHEN l.`table_name` IN ('tb_users', 'tb_people', 'tb_user_addresses') THEN 'Registro'
        WHEN l.`table_name` IN ('tb_carts', 'tbd_cart_items') THEN 'Carrito'
        WHEN l.`table_name` IN ('tb_orders', 'tbd_buyer_orders', 'tbd_order_items') THEN 'Compra'
        WHEN l.`table_name` IN ('tb_payments', 'tb_payment_transaction', 'tb_payment_methods', 'tbd_user_payment_methods') THEN 'Pago'
        WHEN l.`table_name` = 'tb_shipments' THEN 'Envío'
        ELSE 'Otro'
    END AS `fase`,
    CASE
        WHEN l.`table_name` = 'tb_users' AND l.`operation` = 'Create' THEN 'user_not_registered'
        WHEN SUBSTRING_INDEX(l.`db_users`, '@', 1) IN ('pablo.reyes', 'root') THEN 'superadmin'
        ELSE 'common'
    END AS `rol`,
    SUBSTRING_INDEX(l.`db_users`, '@', 1) AS `usuario_ejecutor`,
    l.`db_users` AS `conexion_bd`,
    l.`operation_date` AS `fecha_evento`,
    l.`table_name` AS `tabla_modificada`,
    l.`operation` AS `operacion`,
    l.`description` AS `detalle_evento`,
    'Evento registrado' AS `resultado`
FROM `tb_logs` AS l
WHERE l.`operation_date` >= '2026-11-18 10:45:00'
  AND l.`operation_date` <  '2026-11-18 11:20:00'
  AND l.`table_name` IN ('tb_users','tb_people','tb_user_addresses','tb_carts','tbd_cart_items','tb_orders','tbd_buyer_orders','tbd_order_items','tb_payments','tb_payment_transaction','tb_shipments');

-- Caso 5: falta de inventario, cancelación y liberación/reasignación del cupón (usuario 1, orden 6).
CREATE OR REPLACE VIEW `vw_practica04_caso_5` AS
SELECT
    'Caso 5 - Falta de inventario y cupón' AS `caso`,
    CASE
        WHEN l.`table_name` IN ('tb_users', 'tb_people', 'tb_user_addresses') THEN 'Registro'
        WHEN l.`table_name` IN ('tb_carts', 'tbd_cart_items') THEN 'Carrito'
        WHEN l.`table_name` IN ('tb_orders', 'tbd_buyer_orders', 'tbd_order_items') THEN 'Compra'
        WHEN l.`table_name` IN ('tb_payments', 'tb_payment_transaction', 'tb_payment_methods', 'tbd_user_payment_methods') THEN 'Pago'
        WHEN l.`table_name` IN ('tb_order_cancellations', 'tbd_cancellation_items') THEN 'Cancelación'
        WHEN l.`table_name` = 'tb_products' THEN 'Inventario'
        ELSE 'Otro'
    END AS `fase`,
    CASE
        WHEN l.`table_name` = 'tb_users' AND l.`operation` = 'Create' THEN 'user_not_registered'
        WHEN SUBSTRING_INDEX(l.`db_users`, '@', 1) IN ('pablo.reyes', 'root') THEN 'superadmin'
        ELSE 'common'
    END AS `rol`,
    SUBSTRING_INDEX(l.`db_users`, '@', 1) AS `usuario_ejecutor`,
    l.`db_users` AS `conexion_bd`,
    l.`operation_date` AS `fecha_evento`,
    l.`table_name` AS `tabla_modificada`,
    l.`operation` AS `operacion`,
    l.`description` AS `detalle_evento`,
    'Evento registrado' AS `resultado`
FROM `tb_logs` AS l
WHERE l.`operation_date` >= '2026-11-18 21:40:00'
  AND l.`operation_date` <  '2026-11-18 22:30:00'
  AND l.`table_name` IN ('tb_users','tb_people','tb_user_addresses','tb_carts','tbd_cart_items','tb_orders','tbd_buyer_orders','tbd_order_items','tb_payments','tbd_payment_transaction','tb_order_cancellations','tbd_cancellation_items','tb_payment_methods','tbd_user_payment_methods','tb_products');