/*

	Instruccion Execute :


	EXECUTE / EXEC 

	Se utiliza para ejecutar un procedimiento almacenado, una cadena de comando o una cadena de caracteres dentro de un lote
	de instrucciones de Transact-SQL



*/

USE Northwind
GO

DECLARE @table VARCHAR(40) = 'Employees'

EXECUTE ('SELECT * FROM '+ @table)
GO



DECLARE @table VARCHAR(40) = 'Employees'

EXECUTE ('SELECT 
			FirstName,
			sum(EmployeeId) 
				FROM '+ @table+' 
			GROUP BY FirstName')
GO