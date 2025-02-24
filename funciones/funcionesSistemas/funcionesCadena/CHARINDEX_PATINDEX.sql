/*


    CHARINDEX:

    Busca una expresion de caracteres dentro de una segunda expresion de caracteres, y devuelve
    la posicion inicial de la primera expresion si se encuentra.



    PATINDEX:

    Devuelve la posicion inicial de la primera repeticion de un patron en la expresion especificada
    o ceros si el patron no se encuentra en todos los tipos de datos de texto y caracteres.

*/


-- CHARINDEX
SELECT CHARINDEX('t', 'Cliente') AS Posicion
GO

-- Busqueda en una frase
DECLARE @texto VARCHAR(100)
DECLARE @buscar VARCHAR(20)
SET @texto = 'Aprende SQL Server con el curso M�ster en SQL Server'
SET @buscar = 'SQL'
SELECT CHARINDEX(@buscar, @texto) AS Posicion
GO

-- Busqueda en una frase con el argumento 'posici�n inicial'
DECLARE @texto VARCHAR(100)
DECLARE @buscar VARCHAR(20)
SET @texto = 'Aprende SQL Server con el curso M�ster en SQL Server'
SET @buscar = 'SQL'
SELECT CHARINDEX(@buscar, @texto, 32) AS Posicion
GO

-- Busqueda sin coincidencia
DECLARE @texto VARCHAR(100)
DECLARE @buscar VARCHAR(20)
SET @texto = 'Aprende SQL Server con el curso M�ster en SQL Server'
SET @buscar = 'Excel'
SELECT CHARINDEX(@buscar, @texto, 32) AS Posicion
GO



--  PATINDEX
SELECT PATINDEX('%t%', 'Cliente') AS Posicion
GO

-- Busqueda en una frase
DECLARE @texto VARCHAR(100)
DECLARE @buscar VARCHAR(20)
SET @texto = 'Aprende SQL Server con el curso M�ster en SQL Server'
SET @buscar = '%SQL%'
SELECT PATINDEX(@buscar, @texto) AS Posicion
GO

-- Busqueda con 'caracter especial' en una frase
DECLARE @texto VARCHAR(100)
DECLARE @buscar VARCHAR(20)
SET @texto = 'Aprende SQL Server con el curso M�ster en SQL Server'
SET @buscar = '%M_ster%'
SELECT PATINDEX(@buscar, @texto) AS Posicion
GO

-- Busqueda sin coincidencia
DECLARE @texto VARCHAR(100)
DECLARE @buscar VARCHAR(20)
SET @texto = 'Aprende SQL Server con el curso M�ster en SQL Server'
SET @buscar = 'Excel'
SELECT PATINDEX(@buscar, @texto) AS Posicion
GO