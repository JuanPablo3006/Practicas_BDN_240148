# Documentación de la Práctica 03: Manipulación de Datos, Relaciones, Procedimientos, Funciones y Eventos en Conexiones Remotas

## Resumen General

Esta práctica documenta la implementación y estructura final de la base de datos **`db_test`** (MySQL 9.3.0), incluyendo la simulación de datos, vistas, triggers, funciones, procedimientos almacenados y la generación automatizada de documentación técnica interactiva mediante **Archify**.

## 📋 Descripción del Proyecto

Esta práctica abarca la arquitectura, desarrollo, simulación masiva de datos y documentación técnica de la base de datos relacional **`db_test`** bajo el motor **MySQL 9.3.0**. El proyecto incluye la lógica de negocio completa mediante triggers y procedimientos almacenados, auditoría automatizada, simulación de usuarios y la integración de artefatos interactivos web mediante **Archify**.

---

## 🛠️ Arquitectura y Componentes Técnicos

El sistema está compuesto por los 12 entregables requeridos para la práctica:

| Componente | Cantidad | Descripción |
| :--- | :---: | :--- |
| **Tablas Relacionales** | 26 | Tablas normalizadas que integran entidades principales, catálogos y relaciones *M:N*. |
| **Columnas / Atributos** | 248 | Atributos clasificados por dominio, restricciones de integridad y valores por defecto. |
| **Claves Foráneas (FK)** | 41 | Relaciones de integridad referencial entre entidades y tablas pivote. |
| **Índices** | 81 | Estructuras de optimización para consultas recurrentes y llaves primarias/únicas. |
| **Vistas (Views)** | 26 | Capas de abstracción para reportes, consultas analíticas y proyecciones de datos. |
| **Triggers** | 75 | Disparadores automáticos para validación de negocio, auditoría y actualización de estados. |
| **Funciones Almacenadas** | 7 | Rutinas escalares para cálculos de importes, formateo y reglas de negocio. |
| **Procedimientos Almacenados** | 4 | Procesos batch para inserción transaccional, carga y procesamiento masivo. |
| **Simulación de Datos** | 5,000 | Registros generados para simulación de usuarios activos y carga operativa. |
| **Auditoría de Cambios** | 1 (`tb_logs`) | Tabla dedicada a la trazabilidad de operaciones (INSERT, UPDATE, DELETE). |
| **Respaldo DDL/DML** | 1 | Archivo SQL consolidado en `backups/respaldo031126.sql`. |
| **Documentación Web** | 2 | MERE y Diccionario de datos interactivos con Archify. |

---

## 🚀 Comandos de Terminal

### 1. Visualizar el Diccionario y el MERE desde la Terminal

Puedes lanzar la documentación directamente en tu navegador predeterminado desde **PowerShell**:

* **Abrir Diccionario de Datos:**
  ```powershell
  Start-Process ".archify/erd-db-test-practica03-20261103/diccionario-datos.html"
---

## Diccionario de Datos y MERE de `db_test`

Documentación técnica generada directamente a partir del archivo de respaldo [`respaldo031126.sql`](backups/respaldo031126.sql). El snapshot describe la arquitectura completa del sistema:

* **26** tablas relacionales
* **248** columnas
* **26** vistas
* **75** triggers
* **7** funciones
* **4** procedimientos almacenados
* **81** índices (incluyendo PKs)
* **41** claves foráneas (FKs)

### Artefactos Interactivos

* 📄 **[Diccionario de Datos Interactivo](.archify/erd-db-test-practica03-20261103/diccionario-datos.html):** detalle completo de campos, tipos de datos, valores predeterminados, soporte de NULL, reglas de omisión al insertar, clasificación semántica, claves, índices, vistas, triggers y rutinas.
* 🗺️ **[MERE Interactivo en Archify](.archify/erd-db-test-practica03-20261103/mere.html):** diagrama Entidad-Relación Extendido interactivo con entidades, atributos físicos, claves primarias/foráneas y cardinalidades.
* ⚙️ **Archivos fuente de documentación:** [JSON candidato](.archify/erd-db-test-practica03-20261103/candidate.json) y [script generador reproducible](.archify/erd-db-test-practica03-20261103/build_docs.py).

> **Nota sobre la clasificación y renderizado:**  
> La clasificación semántica se infiere del DDL. La relación autorreferenciada de categorías queda documentada como FK en el diccionario, aunque el motor gráfico de Archify no dibuja líneas recursivas sobre una misma entidad. Todas las verificaciones estructurales fueron superadas exitosamente.

---

## Estructura del Repositorio

1. **Respaldos de BD:** Archivo DDL y datos en `backups/respaldo031126.sql`.
2. **Documentación Archify:** Ubicada en la subcarpeta `.archify/erd-db-test-practica03-20261103/`.
3. **Control de Versiones:** Cambios integrados y sincronizados en la rama principal `master`.