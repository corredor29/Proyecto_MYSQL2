# 🏢 Sistema de Gestión Inmobiliaria – MySQL

## 📌 Descripción del Proyecto

Este proyecto implementa un sistema de gestión inmobiliaria en **MySQL**, para administrar:

* Propiedades (casas, apartamentos, locales comerciales)
* Clientes interesados en compra o arriendo
* Contratos firmados (venta y arriendo)
* Historial de pagos
* Auditoría (cambios de estado y creación de contratos)
* Seguridad por roles (admin, agente, contador)
* Reporte mensual automático de contratos con pagos pendientes

---

## 🗂 Estructura del Proyecto

```text
PROYECTO-MYSQL2/
│
├── dbml/
│   ├── sql.sql               # Script principal: creación de tablas (DDL)
│   ├── inserts.sql           # Inserts de datos de prueba
│   └── index.sql             # Índices para optimización
│
├── doc/
│   └── modeloEntidad-RelacionMER.png   # Diagrama MER (EER) exportado
│
├── eventos/
│   └── evento_reporte.sql    # Evento mensual: reporte de pagos pendientes
│
├── funciones/
│   ├── funcion_1.sql         # UDF: comisión por venta
│   ├── funcion_2.sql         # UDF: deuda pendiente en arriendo
│   └── funcion_3.sql         # UDF: total de propiedades disponibles por tipo
│
├── Logs/
│   ├── LogErrores.sql        # Tabla de logs de errores + ejemplo handler
│   └── LogSistema.sql        # Tabla de logs del sistema (auditoría)
│
├── Triggers/
│   └── triggers.sql          # Triggers de auditoría (estado propiedad / nuevo contrato)
│
├── usuarios_privilegios/
│   └── usuarios.sql          # Roles + usuarios + privilegios
│
├── vistas/
│   └── (opcional)            # Carpeta para vistas si decides agregarlas
│
└── README.md
```

---

## 🧠 Normalización (3FN)

El modelo está normalizado hasta **Tercera Forma Normal (3FN)**:

* Catálogos para evitar repetición: `TipoPropiedad`, `EstadoPropiedad`
* Contratos separados en:

  * `Contratos` (información común)
  * `ContratoArriendo` (solo arriendos)
  * `ContratoVenta` (solo ventas)
* `Pagos` se asocia a `Contratos`, evitando redundancia

---

## 🛠 Cómo ejecutar el proyecto (orden recomendado)

Ejecuta los scripts en este orden para evitar errores de dependencias:

1. **Crear tablas**

   * `dbml/sql.sql`

2. **Crear índices (optimización)**

   * `dbml/index.sql`

3. **Crear logs**

   * `Logs/LogSistema.sql`
   * `Logs/LogErrores.sql`

4. **Crear triggers (auditoría)**

   * `Triggers/triggers.sql`

5. **Crear funciones (UDF)**

   * `funciones/funcion_1.sql`
   * `funciones/funcion_2.sql`
   * `funciones/funcion_3.sql`

6. **Crear evento mensual**

   * `eventos/evento_reporte.sql`
   * Importante: activar scheduler:

     ```sql
     SET GLOBAL event_scheduler = ON;
     ```

7. **Crear usuarios y privilegios**

   * `usuarios_privilegios/usuarios.sql`

8. **Insertar datos de prueba**

   * `dbml/inserts.sql`

---

## ⚙ Funciones (UDF)

* `funcion_1.sql`: Comisión de agente en venta
* `funcion_2.sql`: Deuda pendiente de arriendo
* `funcion_3.sql`: Total de propiedades disponibles por tipo

Ejemplo de uso:

```sql
SELECT CalcularComision(2);
SELECT CalcularDeuda(1);
SELECT TotalDisponibles(1);
```

---

## 🔄 Triggers (Auditoría)

Los triggers registran automáticamente en auditoría:

* Cambio de estado de una propiedad
* Registro de un nuevo contrato

Se consultan así:

```sql
SELECT * FROM AuditoriaEstadoPropiedad;
SELECT * FROM AuditoriaContrato;
```

---

## 📅 Evento mensual

Genera un registro mensual de contratos de arriendo activos con pagos pendientes en la tabla `ReporteMensualMora`.

Ver eventos:

```sql
SHOW EVENTS;
```

Ver reporte:

```sql
SELECT * FROM ReporteMensualMora;
```

---

## 🔐 Roles y Seguridad

Se implementan roles:

* `rol_admin`: acceso total
* `rol_agente`: gestiona propiedades y contratos
* `rol_contador`: gestiona pagos y reportes

Los scripts están en:

* `usuarios_privilegios/usuarios.sql`

---

## 📎 Documentación

* Diagrama MER en: `doc/modeloEntidad-RelacionMER.png`

