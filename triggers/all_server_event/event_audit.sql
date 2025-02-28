-- ============================================
-- CREACIÓN DEL SISTEMA DE AUDITORÍA DDL A NIVEL DE SERVIDOR
-- ============================================

-- Ubicarnos en la Base de Datos MASTER
USE master;
GO

-- Eliminar la Base de Datos SQLDDLTriggerLog si ya existe
DROP DATABASE IF EXISTS SQLDDLTriggerLog;
GO

-- Crear la Base de Datos SQLDDLTriggerLog
CREATE DATABASE SQLDDLTriggerLog;
GO

-- Usar la Base de Datos SQLDDLTriggerLog
USE SQLDDLTriggerLog;
GO

-- Crear la Tabla DDLLog con mejoras
CREATE TABLE DDLLog (
    rowID				BIGINT PRIMARY KEY IDENTITY(1,1),
    eventType			VARCHAR(128),
    postTime			DATETIME2(0),
    spid				INT,
    serverName			VARCHAR(128),
    loginName			VARCHAR(128),
    originalLogin		VARCHAR(128),
    sessionUser			VARCHAR(128),
    userName			VARCHAR(128),
    databaseName		VARCHAR(128),
    schemaName			VARCHAR(128),
    objectName			VARCHAR(128),
    newObjectName		VARCHAR(128) NULL,
    objectType			VARCHAR(128),
    TSqlCommand			VARCHAR(MAX),
    applicationName		VARCHAR(256),
    hostName			VARCHAR(128),
    clientIP			VARCHAR(45) NULL
);
GO

-- Crear o modificar el Trigger de Auditoría a Nivel de Servidor
CREATE OR ALTER TRIGGER TG_DDLServer
ON ALL SERVER
FOR 

    CREATE_TABLE, ALTER_TABLE, DROP_TABLE, 
	RENAME, CREATE_PROCEDURE, ALTER_PROCEDURE, 
	DROP_PROCEDURE,CREATE_FUNCTION, ALTER_FUNCTION, 
	DROP_FUNCTION,CREATE_VIEW, ALTER_VIEW, DROP_VIEW

AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @eventData XML = EVENTDATA();

    -- Insertar los datos en la tabla de auditoría
    INSERT INTO SQLDDLTriggerLog.dbo.DDLLog
    (
        eventType, postTime, spid, serverName, loginName, originalLogin, sessionUser,
        userName, databaseName, schemaName, objectName, newObjectName, objectType, 
        TSqlCommand, applicationName, hostName, clientIP
    )
    SELECT 
        @eventData.value('(/EVENT_INSTANCE/EventType)[1]', 'VARCHAR(128)') AS eventType,
        @eventData.value('(/EVENT_INSTANCE/PostTime)[1]', 'DATETIME2(0)') AS postTime,
        @eventData.value('(/EVENT_INSTANCE/SPID)[1]', 'INT') AS spid,
        @eventData.value('(/EVENT_INSTANCE/ServerName)[1]', 'VARCHAR(128)') AS serverName,
        @eventData.value('(/EVENT_INSTANCE/LoginName)[1]', 'VARCHAR(128)') AS loginName,
        CONVERT(VARCHAR(128), ORIGINAL_LOGIN()) AS originalLogin, -- Convertir ORIGINAL_LOGIN()
        CONVERT(VARCHAR(128), SESSION_USER) AS sessionUser, -- Convertir SESSION_USER
        @eventData.value('(/EVENT_INSTANCE/UserName)[1]', 'VARCHAR(128)') AS userName,
        @eventData.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'VARCHAR(128)') AS databaseName,
        @eventData.value('(/EVENT_INSTANCE/SchemaName)[1]', 'VARCHAR(128)') AS schemaName,
        @eventData.value('(/EVENT_INSTANCE/ObjectName)[1]', 'VARCHAR(128)') AS objectName,
        @eventData.value('(/EVENT_INSTANCE/NewObjectName)[1]', 'VARCHAR(128)') AS newObjectName,
        @eventData.value('(/EVENT_INSTANCE/ObjectType)[1]', 'VARCHAR(128)') AS objectType,
        @eventData.value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'VARCHAR(MAX)') AS TSqlCommand,
        CONVERT(VARCHAR(256), APP_NAME()) AS applicationName, -- Convertir APP_NAME()
        CONVERT(VARCHAR(128), HOST_NAME()) AS hostName, -- Convertir HOST_NAME()
        CONVERT(VARCHAR(45), CONNECTIONPROPERTY('client_net_address')) AS clientIP -- Convertir clientIP
END;
GO



-- Verificar si el trigger está habilitado
SELECT name, is_disabled
FROM sys.server_triggers
WHERE name = 'TG_DDLServer';
GO

-- ============================================
-- PRUEBAS PARA VERIFICAR LA AUDITORÍA
-- ============================================

-- Eliminar la base de datos de pruebas si ya existe
DROP DATABASE IF EXISTS TestDB;
GO

-- Crear una nueva base de datos para pruebas
CREATE DATABASE TestDB;
GO

-- Usar la base de datos de pruebas
USE TestDB;
GO

-- Eliminar la tabla si ya existe
IF OBJECT_ID('Clientes', 'U') IS NOT NULL
    DROP TABLE Clientes;
GO

-- Crear una Tabla de Prueba
CREATE TABLE Clientes (id INT, nombre VARCHAR(50));
GO

-- Modificar la Tabla
ALTER TABLE Clientes ADD edad INT;
GO

-- Renombrar la Tabla (Verificar que exista antes de renombrar)
IF OBJECT_ID('Clientes', 'U') IS NOT NULL
    EXEC sp_rename 'Clientes', 'ClientesNuevos';
GO

-- Eliminar la Tabla si existe
IF OBJECT_ID('ClientesNuevos', 'U') IS NOT NULL
    DROP TABLE ClientesNuevos;
GO

-- Eliminar la vista si ya existe
IF OBJECT_ID('VistaClientes', 'V') IS NOT NULL
    DROP VIEW VistaClientes;
GO

-- Crear y Eliminar una Vista
CREATE VIEW VistaClientes AS SELECT * FROM Clientes;
GO
DROP VIEW VistaClientes;
GO

-- Eliminar el procedimiento almacenado si ya existe
IF OBJECT_ID('sp_Test', 'P') IS NOT NULL
    DROP PROCEDURE sp_Test;
GO

-- Crear y Eliminar un Procedimiento Almacenado
CREATE PROCEDURE sp_Test AS SELECT 'Hola Mundo';
GO
DROP PROCEDURE sp_Test;
GO

-- ============================================
-- CONSULTAR LOS REGISTROS DE AUDITORÍA
-- ============================================

SELECT * FROM SQLDDLTriggerLog.dbo.DDLLog ORDER BY postTime DESC;
GO
