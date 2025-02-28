/* Permitir select todas las tablas */

USE Northwind;
GO

GRANT SELECT TO [hugo];  -- Permite SELECT en todas las tablas de la base de datos
GO

DENY INSERT, UPDATE, DELETE, ALTER, CREATE TABLE TO [hugo];  -- Deniega modificación y creación de tablas
GO

