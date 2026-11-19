-- ============================================================================
-- PRÁCTICA 04 - SCRIPT DE CONSULTAS DE VERIFICACIÓN DE LOS 5 CASOS DE PRUEBA
-- Base de datos: db_test
-- ============================================================================

USE db_test;

-- ============================================================================
-- CASO DE PRUEBA 1:
-- Compra estándar multiproveedor con pago único (Visa) y entrega completa
-- (Orden inicial registrada ID = 1 y orden procesada/entregada ID = 2)
-- ============================================================================

-- 1.1 Orden global registrada y orden global entregada
SELECT *
FROM tb_orders
WHERE ID IN (1, 2)
ORDER BY ID ASC;

-- 1.2 Sub-órdenes por vendedor (5 proveedores entregados)
SELECT *
FROM tbd_buyer_orders
WHERE ID BETWEEN 1 AND 5
ORDER BY ID ASC;

-- 1.3 Pago único aprobado con tarjeta de débito Visa
SELECT *
FROM tb_payments
WHERE order_ID = 2;

SELECT *
FROM tb_payment_transaction
WHERE payment_ID = 1
ORDER BY ID ASC;

-- 1.4 Envíos individuales entregados en domicilio del comprador (user_ID = 7501)
SELECT *
FROM tb_shipments
WHERE buyer_order_ID BETWEEN 1 AND 5
ORDER BY ID ASC;


-- ============================================================================
-- CASO DE PRUEBA 2:
-- Compra multiproveedor con pagos parciales, devolución por daño y reposición
-- (Orden ID = 3, usuario ID = 7292)
-- ============================================================================

-- 2.1 Orden global entregada (33 productos)
SELECT *
FROM tb_orders
WHERE ID = 3;

-- 2.2 Sub-órdenes de los 10 proveedores involucrados
SELECT *
FROM tbd_buyer_orders
WHERE ID BETWEEN 6 AND 15
ORDER BY ID ASC;

-- 2.3 Pagos múltiples/parciales asociados a la orden (5 pagados y 1 pendiente)
SELECT *
FROM tb_payments
WHERE order_ID = 3
ORDER BY ID ASC;

SELECT *
FROM tb_payment_transaction
WHERE payment_ID BETWEEN 2 AND 7
ORDER BY ID ASC;

-- 2.4 Solicitud de devolución cerrada por producto dañado en la sub-orden 9
SELECT *
FROM tb_returns
WHERE ID = 1
  AND buyer_order_ID = 9;

-- 2.5 Envíos regulares (IDs 6 al 15) y envío de reposición Express (ID = 16)
SELECT *
FROM tb_shipments
WHERE buyer_order_ID BETWEEN 6 AND 15
ORDER BY ID ASC;


-- ============================================================================
-- CASO DE PRUEBA 3:
-- Cancelación parcial de partidas antes del envío, reembolso parcial y entrega
-- del resto de la orden (Orden ID = 4, usuario ID = 2)
-- ============================================================================

-- 3.1 Orden global entregada tras ajuste por cancelación parcial
SELECT *
FROM tb_orders
WHERE ID = 4;

-- 3.2 Sub-órdenes: sub-orden 16 cancelada y sub-órdenes 17 y 18 entregadas
SELECT *
FROM tbd_buyer_orders
WHERE ID IN (16, 17, 18)
ORDER BY ID ASC;

-- 3.3 Cancelación parcial por cambio de opinión (Items) y partida cancelada
SELECT *
FROM tb_order_cancellations
WHERE ID = 1
  AND order_ID = 4;

SELECT *
FROM tbd_cancellation_items
WHERE cancellation_ID = 1;

-- 3.4 Pago en efectivo con estado PartiallyRefunded y reembolso aplicado
SELECT *
FROM tb_payments
WHERE order_ID = 4;

SELECT *
FROM tb_refunds
WHERE ID = 1
  AND payment_ID = 8;

SELECT *
FROM tb_payment_transaction
WHERE payment_ID = 8
ORDER BY ID ASC;

-- 3.5 Envíos entregados de las sub-órdenes activas (17 y 18)
SELECT *
FROM tb_shipments
WHERE buyer_order_ID IN (17, 18)
ORDER BY ID ASC;


-- ============================================================================
-- CASO DE PRUEBA 4:
-- Compra con pago en efectivo y entrega en punto de recolección (Pickup Point)
-- (Orden ID = 5, usuario ID = 10)
-- ============================================================================

-- 4.1 Orden global entregada
SELECT *
FROM tb_orders
WHERE ID = 5;

-- 4.2 Sub-orden del proveedor (seller_ID = 55)
SELECT *
FROM tbd_buyer_orders
WHERE ID = 19;

-- 4.3 Pago en efectivo aprobado
SELECT *
FROM tb_payments
WHERE order_ID = 5;

SELECT *
FROM tb_payment_transaction
WHERE payment_ID = 9
ORDER BY ID ASC;

-- 4.4 Envío entregado bajo modalidad Pickup Point
SELECT *
FROM tb_shipments
WHERE buyer_order_ID = 19;


-- ============================================================================
-- CASO DE PRUEBA 5:
-- Pago con cupón de regalo, orden no atendida/cancelada por falta de stock
-- y reasignación del cupón al comprador (Orden ID = 6, usuario ID = 1)
-- ============================================================================

-- 5.1 Catálogos y cupón de regalo reasignado al usuario ID = 1
SELECT *
FROM tbc_payment_methods_types
WHERE ID = 4;

SELECT *
FROM tb_payment_methods
WHERE ID = 5;

SELECT *
FROM tbd_user_payment_methods
WHERE ID = 5
  AND user_ID = 1;

-- 5.2 Orden global y sub-orden marcadas como Canceled (status = 0x00)
SELECT *
FROM tb_orders
WHERE ID = 6;

SELECT *
FROM tbd_buyer_orders
WHERE ID = 20;

-- 5.3 Intento de pago fallido (OUT_OF_STOCK) y transacción Void de liberación
SELECT *
FROM tb_payments
WHERE order_ID = 6;

SELECT *
FROM tb_payment_transaction
WHERE payment_ID = 10
ORDER BY ID ASC;

-- 5.4 Cancelación global automática por falta de inventario y partida afectada
SELECT *
FROM tb_order_cancellations
WHERE ID = 2
  AND order_ID = 6;

SELECT *
FROM tbd_cancellation_items
WHERE cancellation_ID = 2;

-- 5.5 Verificación de integridad de inventario del producto solicitado (stock intacto en 2)
SELECT ID, SKU, name, current_price, current_stock, status
FROM tb_products
WHERE ID = 76;


-- ============================================================================
-- VERIFICACIÓN COMPLEMENTARIA: DICCIONARIO DE DATOS Y BITÁCORA DE AUDITORÍA
-- ============================================================================

-- Poblado de lista de deseos de usuarios (tbd_users_wishlist_products)
SELECT *
FROM tbd_users_wishlist_products
ORDER BY user_ID ASC, product_ID ASC;

-- Últimos registros de auditoría generados automáticamente por triggers en tb_logs
SELECT *
FROM tb_logs
ORDER BY ID DESC
LIMIT 20;