/*

	EXISTS

	El operador logico  EXISTS se utiliza en combinacion con una subconsulta y se considera cumplida si la subconsulta devuelve al menos una fila.

	El resultado de EXISTS es un valor booleano Verdadero o Falso y se puede utilizar en un delcaracion SELECT , INSERT , UPDATE O DELETE


	Sintaxis =

	EXISTS (subquery)

*/



USE Northwind
GO


/* 
	Crear una variable llamado 'IdEmpleado' y le debes asignar un valor para mostrar los datos del empleado y si el 'IdEmpleado' no existe se debe
	mostrar el mensaje:

	'El empleado no existe'

*/


BEGIN TRANSACTION 
	

	DECLARE @idEmpleado		AS INT			  SET @idEmpleado	= 9
	DECLARE @dboEmpleado	AS VARCHAR(10)	  SET @dboEmpleado	= 'Employees'
	DECLARE @sqlQuery		AS NVARCHAR(100)  SET @sqlQuery		= CONCAT('SELECT * FROM ', @dboEmpleado)

		IF EXISTS (SELECT * FROM Employees WHERE EmployeeID = @idEmpleado)
		BEGIN 
			PRINT 'El empleado si Existe'
			EXECUTE sp_executesql @sqlQuery
		END
		ELSE 
			PRINT 'El empleado no existe'

COMMIT TRANSACTION
GO




-- Ejercicio Propuesto
/*
Crear una variable llamado "precio" y le debes asignar un valor
para mostrar los Productos(Products) donde el valor de la
variable "precio" debe ser mayor o igual al valor del campo "UnitPrice"
Si el "precio" no existe se debe mostrar el mensaje:
"No se ha encontrado ning�n producto!"
Ordenar de manera Descendente por el campo "UnitPrice"
*/


DECLARE @precio DECIMAL(7,2) = 50

IF EXISTS ( SELECT * FROM Products WHERE UnitPrice >= @precio )
BEGIN
	PRINT('El/los productos son:')
	PRINT('')
	SELECT * FROM Products WHERE UnitPrice >= @precio
	ORDER BY UnitPrice DESC
END
ELSE
BEGIN
	PRINT('No se ha encontrado ning�n producto!')
END
GO