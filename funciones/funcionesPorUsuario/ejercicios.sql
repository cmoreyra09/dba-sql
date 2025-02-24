-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


-- Ejercicio 1
/*
Crear una funci�n llamada "Fn_getCylinderVolume" que har� lo siguiente:
Calcule el Volumen de un Cilindro, teniendo en cuenta que: 
La f�rmula del Volumen es: Pi por Radio al cuadrado por la altura
El radio y la altura nosotros debemos de asignarle un valor.
*/
CREATE OR ALTER FUNCTION Fn_getCylinderVolume
( 
@radio DECIMAL(7,2), @altura DECIMAL(7,2)
)
RETURNS DECIMAL(7,2)
AS
BEGIN

	DECLARE @volumen DECIMAL(7,2)

	SET @volumen = PI() * POWER(@radio, 2) * @altura

	RETURN @volumen
	
END
GO


-- Validar la funci�n "Fn_getCylinderVolume"
SELECT dbo.Fn_getCylinderVolume(5, 10) AS Volumen
GO

PRINT dbo.Fn_getCylinderVolume(5, 10)
GO



-- Consultar la Tabla Person.Address
SELECT * FROM Person.Address
GO


-- Ejercicio 2
/*
Crear una funci�n llamada "Fn_SearchAddresByCity" 
que tendra un par�metro llamado "@City" que ser� un NVARCHAR(30)
Se debe utilizar la Tabla Address y mostrar las columnas
AddressLine1, AddressLine2, City y PostalCode
donde el valor de columna "City" debe ser igual al par�metro "@City"
Puedes utilizar la Funci�n con Valores de Tabla en L�nea o
Funci�n con Valores de Tabla de M�ltiples Declaraciones
*/
-- Funci�n con Valores de Tabla en L�nea
CREATE OR ALTER FUNCTION Fn_SearchAddresByCity( @City NVARCHAR(30))
RETURNS TABLE
AS
RETURN(
	SELECT AddressLine1, AddressLine2, City, PostalCode
	FROM Person.Address
	WHERE City = @City
)
GO


-- Validar la funci�n "Fn_SearchAddresByCity"
SELECT * 
FROM dbo.Fn_SearchAddresByCity('Paris')
GO