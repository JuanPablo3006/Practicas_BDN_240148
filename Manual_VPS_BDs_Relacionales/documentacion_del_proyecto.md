# Despliegue y Gestión de Bases de Datos Relacionales (PostgreSQL & MySQL) en Entornos Contenerizados (VPS)

> **Asignatura:** Formulación y Evaluación de Proyectos de Software
> **Institución:** Universidad Tecnológica de Xicotepec de Juárez (UTXJ)
> **Alumno / Matrícula:** Juan Pablo Reyes Cruz / 240148
> **Rama Git Obligatoria:** `Manual_VPS_BDs_Relacionales`

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