/* Otorgar permisos a nivel de esquema */

USE Northwind;
GO

GRANT SELECT ON SCHEMA::[dbo] TO [hugo];  -- Permite SELECT en todas las tablas del esquema dbo
GO

DENY INSERT, UPDATE, DELETE ON SCHEMA::[dbo] TO [hugo];  -- Deniega modificaciones en todas las tablas
GO

