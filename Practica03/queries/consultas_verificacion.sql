-- ============================================================================
-- SCRIPT DE VERIFICACIÓN Y VALIDACIÓN INTEGRAL - PRÁCTICA 03
-- Base de Datos: db_test
-- ============================================================================

USE db_test;

-- ----------------------------------------------------------------------------
-- 1. CANTIDAD TOTAL DE TABLAS, TRIGGERS, VISTAS, RUTINAS Y REGISTROS GENERADOS
-- ----------------------------------------------------------------------------
SELECT '--- 1.1 OBJETOS EN EL ESQUEMA (TABLAS Y VISTAS) ---' AS seccion;
SELECT 
    TABLE_TYPE AS tipo_objeto,
    COUNT(*) AS cantidad
FROM information_schema.TABLES 
WHERE TABLE_SCHEMA = 'db_test'
GROUP BY TABLE_TYPE;

SELECT '--- 1.2 TOTAL DE TRIGGERS ---' AS seccion;
SELECT COUNT(*) AS total_triggers 
FROM information_schema.TRIGGERS 
WHERE TRIGGER_SCHEMA = 'db_test';

SELECT '--- 1.3 RUTINAS Y PROCEDIMIENTOS ALMACENADOS ---' AS seccion;
SELECT 
    ROUTINE_TYPE AS tipo_rutina,
    COUNT(*) AS cantidad
FROM information_schema.ROUTINES 
WHERE ROUTINE_SCHEMA = 'db_test'
GROUP BY ROUTINE_TYPE;

SELECT '--- 1.4 CONTEO TOTAL DE REGISTROS POR TABLA ---' AS seccion;
SELECT 'tb_users' AS tabla, COUNT(*) AS total_registros FROM tb_users
UNION ALL
SELECT 'tbc_categories', COUNT(*) FROM tbc_categories
UNION ALL
SELECT 'tb_products', COUNT(*) FROM tb_products
UNION ALL
SELECT 'tb_logs', COUNT(*) FROM tb_logs;


-- ----------------------------------------------------------------------------
-- 2. DISTRIBUCIÓN GENERAL DE USUARIOS
-- ----------------------------------------------------------------------------
SELECT '--- 2.1 CONTEO TOTAL DE USUARIOS REGISTRADOS ---' AS seccion;
SELECT COUNT(*) AS total_usuarios FROM tb_users;


-- ----------------------------------------------------------------------------
-- 3. PROPORCIÓN DE USUARIOS ACTIVOS E INACTIVOS (CRITERIO PROBABILÍSTICO 80/20)
-- ----------------------------------------------------------------------------
SELECT '--- 3.1 DISTRIBUCIÓN PROBABILÍSTICA ACTIVOS/INACTIVOS ---' AS seccion;
SELECT 
    CASE status
        WHEN b'1' THEN 'Activo (b''1'')'
        WHEN b'0' THEN 'Inactivo (b''0'')'
        ELSE 'Otro'
    END AS estado_cuenta,
    COUNT(*) AS total_usuarios,
    CONCAT(ROUND((COUNT(*) / (SELECT COUNT(*) FROM tb_users)) * 100, 2), '%') AS porcentaje_observado,
    CASE 
        WHEN status = b'1' THEN '80.00%'
        ELSE '20.00%'
    END AS porcentaje_esperado
FROM tb_users
GROUP BY status;


-- ----------------------------------------------------------------------------
-- 4. EXISTENCIA DE PRODUCTOS Y SU DISTRIBUCIÓN ENTRE VENDEDORES REMOTOS
-- ----------------------------------------------------------------------------
SELECT '--- 4.1 TOTAL GLOBAL DE PRODUCTOS EN INVENTARIO ---' AS seccion;
SELECT COUNT(*) AS total_productos FROM tb_products;

-- 4.2 Distribución de inserciones por vendedor remoto (usando 'Create')
SELECT 
    SUBSTRING_INDEX(db_users, '@', 1) AS vendedor_remoto,
    table_name AS tabla,
    COUNT(*) AS productos_insertados
FROM tb_logs
WHERE table_name = 'tb_products' 
  AND operation = 'Create'
GROUP BY db_users, table_name;

-- ----------------------------------------------------------------------------
-- 5. CUMPLIMIENTO DE COBERTURA MÍNIMA DE PRODUCTOS POR CATEGORÍA
-- ----------------------------------------------------------------------------
SELECT '--- 5.1 VERIFICAR SI EXISTEN CATEGORÍAS SIN PRODUCTOS (< 1 PRODUCTO) ---' AS seccion;
SELECT 
    c.ID AS category_id,
    c.name AS categoria,
    COUNT(pc.product_ID) AS total_productos
FROM tbc_categories c
LEFT JOIN tbd_products_categories pc ON c.ID = pc.category_ID
GROUP BY c.ID, c.name
HAVING total_productos < 1;


-- ----------------------------------------------------------------------------
-- 6. VERIFICACIÓN DE PRODUCTOS DESCONTINUADOS (status = b'0')
-- ----------------------------------------------------------------------------
SELECT '--- 6.1 DISTRIBUCIÓN DE PRODUCTOS ACTIVOS VS DESCONTINUADOS ---' AS seccion;
SELECT 
    CASE status
        WHEN b'1' THEN 'Activo (b''1'')'
        WHEN b'0' THEN 'Descontinuado (b''0'')'
    END AS estado_producto,
    COUNT(*) AS total_productos,
    CONCAT(ROUND((COUNT(*) / (SELECT COUNT(*) FROM tb_products)) * 100, 2), '%') AS porcentaje_observado
FROM tb_products
GROUP BY status;

SELECT '--- 6.2 MUESTRA DE PRODUCTOS DESCONTINUADOS ---' AS seccion;
SELECT ID, SKU, name, current_price, status 
FROM tb_products 
WHERE status = b'0' 
LIMIT 10;


-- ----------------------------------------------------------------------------
-- 7. AUDITORÍA Y TRAZABILIDAD DE ROLES REMOTOS (superadmin, support, seller)
-- ----------------------------------------------------------------------------
-- 7.1 Trazabilidad completa en tb_logs por usuario y tabla
SELECT 
    SUBSTRING_INDEX(db_users, '@', 1) AS usuario_bd,
    table_name AS tabla_afectada,
    operation AS operacion,
    COUNT(*) AS total_eventos,
    MIN(operation_date) AS primera_operacion,
    MAX(operation_date) AS ultima_operacion
FROM tb_logs
GROUP BY db_users, table_name, operation
ORDER BY usuario_bd, table_name;

-- ----------------------------------------------------------------------------
-- 8. INTEGRIDAD REFERENCIAL Y REGISTROS HUÉRFANOS
-- ----------------------------------------------------------------------------
SELECT '--- 8.1 PRODUCTOS EN TBD INEXISTENTES EN TB_PRODUCTS ---' AS seccion;
SELECT pc.product_ID 
FROM tbd_products_categories pc
LEFT JOIN tb_products p ON pc.product_ID = p.ID
WHERE p.ID IS NULL;

SELECT '--- 8.2 CATEGORÍAS EN TBD INEXISTENTES EN TBC_CATEGORIES ---' AS seccion;
SELECT pc.category_ID 
FROM tbd_products_categories pc
LEFT JOIN tbc_categories c ON pc.category_ID = c.ID
WHERE c.ID IS NULL;

SELECT '--- 8.3 CATEGORÍAS PADRE INEXISTENTES EN TBC_CATEGORIES ---' AS seccion;
SELECT child.ID, child.name, child.sup_id_category
FROM tbc_categories child
LEFT JOIN tbc_categories parent ON child.sup_id_category = parent.ID
WHERE child.sup_id_category IS NOT NULL AND parent.ID IS NULL;

-- ----------------------------------------------------------------------------
-- 9. PROCEDIMIENTO ALMACENADO
-- ----------------------------------------------------------------------------

-- Parámetros: 5,000 usuarios, género aleatorio ('*'), país aleatorio ('*'), edad 18 a 65 años, 80% activos (0.80)
CALL sp_simular_usuarios(5000, '*', '*', 18, 65, 0.80);

-- 1. Total de usuarios registrados
SELECT COUNT(*) AS total_usuarios FROM tb_users;

-- 2. Proporción de estatus (Activos vs Inactivos)
SELECT 
    IF(status = b'1', 'Activo (1)', 'Inactivo (0)') AS estado,
    COUNT(*) AS total,
    CONCAT(ROUND((COUNT(*) / (SELECT COUNT(*) FROM tb_users)) * 100, 2), '%') AS porcentaje
FROM tb_users
GROUP BY status;s