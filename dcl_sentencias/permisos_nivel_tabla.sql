
/*Otorgando Permisos a Nivel de Tabla*/


USE Northwind;
GO

-- Crear usuario en la base de datos
CREATE USER [Hugo] FOR LOGIN [Hugo] WITH DEFAULT_SCHEMA = [dbo];
GO


-- Dar permisos de select 
GRANT SELECT ON [dbo].[Customers] TO [Hugo];  -- Permite solo SELECT
GO

-- Denegar permisos de insert
DENY INSERT ON [dbo].[Customers] TO [Hugo];  -- Deniega INSERT
GO