# Despliegue y Gestión de Bases de Datos Relacionales (PostgreSQL & MySQL) en Entornos Contenerizados (VPS)

> **Asignatura:** Formulación y Evaluación de Proyectos de Software
> **Institución:** Universidad Tecnológica de Xicotepec de Juárez (UTXJ)
> **Alumno / Matrícula:** Juan Pablo Reyes Cruz / 240148
> **Rama Git Obligatoria:** `Manual_VPS_BDs_Relacionales`

---

## Tabla de Contenidos

1. [Descripción General](#-descripción-general)
2. [Arquitectura e Infraestructura](#-arquitectura-e-infraestructura)
3. [Mapeo de Puertos Personalizados](#-mapeo-de-puertos-personalizados)
4. [Estructura del Repositorio](#-estructura-del-repositorio)
5. [Guía de Despliegue Rápido](#-guía-de-despliegue-rápido)
6. [Diseño y Modelado de la Base de Datos](#-diseño-y-modelado-de-la-base-de-datos)
7. [Matriz de Control de Accesos y Roles (RBAC)](#-matriz-de-control-de-accesos-y-roles-rbac)
8. [Reglas de Negocio Implementadas (Triggers & Vistas)](#-reglas-de-negocio-implementadas-triggers--vistas)
9. [Pruebas de Funcionalidad y Auditoría](#-pruebas-de-funcionalidad-y-auditoría)
10. [Flujo de Trabajo Git / Versionado](#-flujo-de-trabajo-git--versionado)

---

## Descripción General

Este proyecto consiste en el diseño, provisión y despliegue automatizado de un entorno multi-motor de bases de datos relacionales (**PostgreSQL 15** y **MySQL 8.0**) utilizando la tecnología de contenedores **Docker Compose** sobre un Servidor Privado Virtual (VPS). 

El sistema administra un dominio de **Comercio Electrónico (E-commerce)** implementando mecanismos avanzados de control de acceso basándose en roles (**RBAC**), automatización de auditorías mediante **Triggers** y segregación de puertos a nivel de red externa para cumplir con las políticas de seguridad institucional.

---

## Arquitectura e Infraestructura

```text
                               ┌─────────────────────────────────────────┐
                               │           VPS (Cloud Server)            │
                               │                                         │
┌───────────────────┐  TCP     │   ┌─────────────────────────────────┐   │
│   Cliente Remoto  ├──────────┼──►│ Contenedor: postgres_240148     │   │
│   (pgAdmin / CLI) │  :40148  │   │ PostgreSQL 15 | Interno: 5432   │   │
└───────────────────┘          │   └─────────────────────────────────┘   │
                               │                                         │
┌───────────────────┐  TCP     │   ┌─────────────────────────────────┐   │
│   Cliente Remoto  ├──────────┼──►│ Contenedor: mysql_240148        │   │
│  (MySQL Workbench)│  :40149  │   │ MySQL 8.0     | Interno: 3306   │   │
└───────────────────┘          │   └─────────────────────────────────┘   │
                               └─────────────────────────────────────────┘
```

---

## Mapeo de Puertos Personalizados

De acuerdo con el estándar estipulado por la evaluación técnica individual, el aislamiento de red en el host se parametriza mediante el número de matrícula (`240148`):

| Motor de BDF | Puerto Host (VPS) | Puerto Contenedor (Interno) | Contenedor ID | Estado |
| :--- | :---: | :---: | :--- | :---: |
| **PostgreSQL** | `40148` | `5432` | `postgres_240148` | Active / Running |
| **MySQL** | `40149` | `3306` | `mysql_240148` | Active / Running |

---

## Estructura del Repositorio

```text
.
├── docker-compose.yml               # Definición de infraestructura como código (IaC)
├── README.md                        # Documentación técnica general
├── Reporte_Unidad1_240148.pdf       # Reporte técnico individual de evaluación
└── sql/
    ├── postgresql.sql               # DDL, DML, RBAC, Triggers y Vistas (PostgreSQL)
    └── mysql.sql                    # DDL, DML, RBAC, Triggers y Vistas (MySQL)
```

---

## Guía de Despliegue Rápido

### Prerrequisitos
* Engine Docker v20.10+ instalado en el VPS.
* Docker Compose v2.0+ habilitado.
* Cliente SQL local (pgAdmin 4, DBeaver o CLI).

### 1. Clonar repositorio y cambiar de rama
```bash
git clone <URL-DEL-REPOSITORIO>
cd <NOMBRE-DEL-PROYECTO>
git checkout Manual_VPS_BDs_Relacionales
```

### 2. Levantar servicios contenerizados
```bash
docker-compose up -d
```

### 3. Verificar estado de los contenedores
```bash
docker-compose ps
```

### 4. Conexión Remota desde Cliente Local
* **Host/IP:** `<IP_DE_TU_VPS>`
* **Port (PostgreSQL):** `40148`
* **Username:** `postgres`
* **Database:** `e_commerce`

---

## Diseño y Modelado de la Base de Datos

El esquema principal `e_commerce` comprende el siguiente modelo relacional base:

* **`categorias`**: Catálogo de clasificación de mercancía.
* **`productos`**: Almacena artículos, stock, precio unitario y referencia a categoría.
* **`clientes`**: Datos demográficos y credenciales de compradores.
* **`pedidos`**: Encabezado de transacciones comerciales de compra.
* **`detalles_pedido`**: Desglose de ítems solicitados por cada pedido.
* **`auditoria_precios`**: Tabla de trazabilidad de cambios en precios de productos.

---

## Matriz de Control de Accesos y Roles (RBAC)

Se han definido 7 roles estrictos a nivel de motor de base de datos para garantizar el principio de menor privilegio:

| Rol | Privilegios y Alcance | Asignado A / Propósito |
| :--- | :--- | :--- |
| **`administrador`** | Superusuario. Control total sobre DDL, DML y administración de roles. | DBA y Líder de Proyecto |
| **`desarrollador`** | Control DDL/DML completo sobre tablas de desarrollo, sin acceso a auditoría directa. | Equipo Dev / Backend |
| **`analista_datos`** | Permisos de lectura analítica (`SELECT`) sobre vistas y tablas consolidadas. | Reporteo y Business Intelligence |
| **`auditor`** | Acceso exclusivo de lectura (`SELECT`) a tablas e historial de auditoría. | Cumplimiento y Seguridad |
| **`vendedor`** | `INSERT`, `UPDATE`, `SELECT` en `pedidos` y `detalles_pedido`. | Operaciones de Venta |
| **`cliente_role`** | Acceso de lectura sobre catálogo público de `productos` y sus propios pedidos. | Usuarios Finales / App Móvil |
| **`guest`** | Acceso de solo lectura restringido al catálogo de `categorias` y `productos`. | Visitantes no autenticados |

---