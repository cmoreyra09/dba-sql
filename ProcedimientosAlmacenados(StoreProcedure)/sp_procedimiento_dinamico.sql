
-- SP Dinamico utilizando un sp de sistema para ejecutar una consulta

CREATE OR ALTER PROCEDURE SP_006_DynamicProcedure (
												@table NVARCHAR(50)


)
	AS
		BEGIN
				
				DECLARE @script NVARCHAR(255) SET @script = ('SELECT * FROM ' + @table)
				

				EXEC SP_EXECUTESQL @script

			
		END
		GO -- Lote de instrucciones GO



EXECUTE SP_006_DynamicProcedure 'Production.Product' 
GO







-- Consultas Dinamicas :





CREATE OR ALTER PROCEDURE SP_007_DynamicPerson (
						@option CHAR(1) = 'B'

)
AS
	BEGIN

		DECLARE @query	AS NVARCHAR(MAX)
		DECLARE @order	AS NVARCHAR(MAX)
		DECLARE @script AS NVARCHAR(MAX)

		SET @query = 
			N'SELECT 
				BusinessEntityID,
				Title,
				FirstName,
				MiddleName,
				LastName
					FROM Person.Person'

		SET @order =	
					CASE 
						WHEN @option = 'B' THEN ' ORDER BY BusinessEntityID '
						WHEN @option = 'T' THEN ' ORDER BY Title '
						WHEN @option = 'F' THEN ' ORDER BY FirstName '
						WHEN @option = 'M' THEN ' ORDER BY MiddleName '
						WHEN @option = 'L' THEN ' ORDER BY LastName '
					END


		 SET @script = @query + @order

		 EXEC SP_EXECUTESQL @script


	END
	GO



EXEC SP_007_DynamicPerson
GO
