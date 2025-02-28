/*

    Parametros Output :

        Un parametros output en un procedimiento almacenado es un tipo de parametros en los cuales permiten devolver
        un valor de valores desde el procedimiento almacenado al codgio que lo invoca.

        Esto es util cuando necesitamos que retorne datos adicionales, ademas de los resultados de una consulta o cuando no se quiere usar un conjunto de resultados
        para devolver un valor especifico.


*/


-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


-- Crear otro Procedimiento Almacenado Din�mico
-- Con Par�metro OutPut
CREATE OR ALTER PROCEDURE SP_008_DynamicPersonOutPut
(
	@letter CHAR(1) = 'B',
	@rowNumber INT OUT
)
AS
BEGIN

	DECLARE @query VARCHAR(500), @order VARCHAR(100)
	DECLARE @script NVARCHAR(MAX)

	SET @query = 'SELECT BusinessEntityID, Title, FirstName, MiddleName, LastName FROM Person.Person'

	SET @order = (CASE
					WHEN @letter = 'B' THEN ' ORDER BY BusinessEntityID'
					WHEN @letter = 'T' THEN ' ORDER BY Title'
					WHEN @letter = 'F' THEN ' ORDER BY FirstName'
					WHEN @letter = 'L' THEN ' ORDER BY LastName'
				  END)

	SET @script = @query + @order

	EXEC SP_EXECUTESQL @script

	SET @rowNumber = @@ROWCOUNT

END
GO


-- Ejecutar el Procedimiento Almacenado Din�mico
-- Con par�metro OutPut
DECLARE @variable INT
EXEC SP_008_DynamicPersonOutPut 'B', @variable OUTPUT
SELECT @variable AS rowNumber
GO






-- Crear otro Procedimiento Almacenado Din�mico
-- Con Par�metro OutPut
CREATE OR ALTER PROCEDURE SP_009_DynamicPersonOutPut
(
	@letter CHAR(1) = 'B',
	@out NVARCHAR(MAX) OUT
)
AS
BEGIN

	DECLARE @query VARCHAR(500), @order VARCHAR(100)

	SET @query = 'SELECT BusinessEntityID, Title, FirstName, MiddleName, LastName FROM Person.Person'

	SET @order = (CASE
					WHEN @letter = 'B' THEN ' ORDER BY BusinessEntityID'
					WHEN @letter = 'T' THEN ' ORDER BY Title'
					WHEN @letter = 'F' THEN ' ORDER BY FirstName'
					WHEN @letter = 'L' THEN ' ORDER BY LastName'
				  END)

	SET @out = @query + @order

END
GO


-- Ejecutar el Procedimiento Almacenado Din�mico
-- Con par�metro OutPut
DECLARE @salida NVARCHAR(MAX)
EXEC SP_009_DynamicPersonOutPut 'T', @salida OUTPUT
PRINT(@salida)
EXEC SP_EXECUTESQL @salida
GO