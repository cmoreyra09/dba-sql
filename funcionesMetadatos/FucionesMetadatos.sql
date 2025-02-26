/*


    Funciones Metadatos


    En SQL server , las funciones de metadatos son funciones integradas que proporcionan informacion sobre la base de datos y sus objetos.
    Estas funciones permiten a los administradores de bases de datos y sus objetos.


    Estas funciones permiten a los administradores de bases de datos y a los desarrolladores consultar propiedades y caracteristicas de la base de datos, sus tablas columnas, indices
    procedimientos almacenadosl, vistas y otros objetos. Son herramientas esenciales para gestionar y mantener la base de datos
    de manera eficiente.

*/



/*


Tipo Comunes de funciones de metadatos

 - Informacion sobre bases de datos 

    (1) -- Devuelve la base de datos donde se encuentra.
    (2) -- Devuelve la base de datos donde estas consulta y su estado de actividad.


*/

SELECT DB_NAME(); -- (1)
SELECT DATABASEPROPERTYEX('EmpresaX','Status'); -- (2)
 



-- Informacion Sobre Objetos


SELECT OBJECT_ID('dbo.FactVentas'); -- Devuelve el id del la tabla creada
SELECT OBJECT_NAME(OBJECT_ID('dbo.FactVentas')); -- Devuelve el nombre de la tabla creada







USE RawDataLake
GO

SELECT OBJECT_ID('dbo.FactVentas'); -- Devuelve el id del la tabla creada
SELECT OBJECT_NAME(OBJECT_ID('dbo.FactVentas')); -- Devuelve el nombre de la tabla creada



-- Informacion sobre columnas :


SELECT 
    -- 📌 Información sobre la Base de Datos
    DB_NAME() AS BaseDatos_Actual,
    DB_ID() AS ID_BaseDatos,
    DATABASE_PRINCIPAL_ID() AS ID_Principal_BD,
    DATABASEPROPERTYEX(DB_NAME(), 'Status') AS Estado_BaseDatos,
    ORIGINAL_DB_NAME() AS Nombre_Original_BD,
    SERVERPROPERTY('ProductVersion') AS Version_SQLServer,
    
    -- 📌 Información sobre Objetos y Esquemas
    OBJECT_ID('sys.objects') AS ID_Objeto,
    OBJECT_NAME(OBJECT_ID('sys.objects')) AS Nombre_Objeto,
    OBJECT_SCHEMA_NAME(OBJECT_ID('sys.objects'), DB_ID()) AS Esquema_Objeto,
    SCHEMA_NAME() AS Esquema_Actual,
    SCHEMA_ID() AS ID_Esquema,
    
    -- 📌 Información sobre Columnas y Tablas
    COLUMNPROPERTY(OBJECT_ID('dbo.MiTabla'), 'MiColumna', 'IsIdentity') AS Es_Columna_Identity,
    COL_NAME(OBJECT_ID('dbo.MiTabla'), 1) AS Primera_Columna_Tabla,
    COL_LENGTH('dbo.MiTabla', 'MiColumna') AS Longitud_Columna,
    
    -- 📌 Información sobre Índices
    INDEX_COL('dbo.MiTabla', 1, 1) AS Primera_Columna_Indice,
    INDEXPROPERTY(OBJECT_ID('dbo.MiTabla'), 'PK_MiTabla', 'IsUnique') AS Es_Indice_Unico,
    INDEXKEY_PROPERTY(OBJECT_ID('dbo.MiTabla'), 1, 1, 'ColumnId') AS ID_Primera_Columna_Clave,
    
    -- 📌 Información sobre Archivos y Grupos de Archivos
    FILE_ID('MiArchivo') AS ID_Archivo,
    FILE_NAME(1) AS Nombre_Archivo,
    FILEGROUP_ID('PRIMARY') AS ID_Grupo_Archivos,
    FILEGROUP_NAME(1) AS Nombre_Grupo_Archivos,
    FILEPROPERTY('MiArchivo', 'IsReadOnly') AS Archivo_EsSoloLectura,
    
    -- 📌 Información sobre Seguridad y Usuarios
    SUSER_NAME() AS Usuario_Servidor,
    USER_NAME() AS Usuario_BaseDatos,
    APP_NAME() AS Aplicacion_Conectada,
    
    -- 📌 Información sobre Objetos y Propiedades Avanzadas
    OBJECTPROPERTY(OBJECT_ID('dbo.MiTabla'), 'TableHasPrimaryKey') AS Tabla_TienePK,
    OBJECTPROPERTYEX(OBJECT_ID('dbo.MiTabla'), 'IsUserTable') AS Es_Tabla_Usuario,
    OBJECT_DEFINITION(OBJECT_ID('dbo.MiProcedimiento')) AS Codigo_Procedimiento,
    
    -- 📌 Otras Propiedades y Funciones Útiles
    STATS_DATE(OBJECT_ID('dbo.MiTabla'), 1) AS Fecha_Actualizacion_Stats,
    TYPE_NAME(TYPE_ID('int')) AS Nombre_Tipo_Dato,
    TYPEPROPERTY(TYPE_ID('int'), 'Precision') AS Precision_Tipo_Dato
