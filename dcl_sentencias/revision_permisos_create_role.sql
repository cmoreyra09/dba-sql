USE Northwind;
GO

-- Crear un rol con permisos solo de lectura
CREATE ROLE ReadOnlyRole;
GO

-- Asignar permisos al rol
GRANT SELECT TO ReadOnlyRole;  
DENY INSERT, UPDATE, DELETE TO ReadOnlyRole;
GO

-- Agregar el usuario 'hugo' al rol
ALTER ROLE ReadOnlyRole ADD MEMBER [hugo];
GO


/* ✅ 5. Revisar los permisos actuales del usuario */
USE Northwind;
GO
EXEC sp_helprotect @username = 'hugo';



USE Northwind;
GO
EXEC sp_helprotect @username = 'hugo', @objname = 'Customers';
