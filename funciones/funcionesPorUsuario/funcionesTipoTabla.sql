-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


/*----------------------------------------------------
		CREAMOS LA FUNCI�N DE TABLA(En L�nea)
-----------------------------------------------------*/
CREATE OR ALTER FUNCTION Mostrar_Empleados_HorasVacaciones(@hora SMALLINT) 
RETURNS TABLE
AS 
RETURN(
	SELECT BusinessEntityID, JobTitle, BirthDate, HireDate,
			Gender, MaritalStatus, VacationHours
	FROM HumanResources.Employee
	WHERE VacationHours <= @hora
)
GO


/*------------------------------------------------
	Consultar todas las columnas mediante SELECT
--------------------------------------------------*/
SELECT *
FROM Mostrar_Empleados_HorasVacaciones(50)
ORDER BY VacationHours DESC
GO


/*------------------------------------------------
	Consultar algunas columnas mediante SELECT
--------------------------------------------------*/
SELECT BusinessEntityID, JobTitle, HireDate, VacationHours  
FROM Mostrar_Empleados_HorasVacaciones(50)
ORDER BY VacationHours DESC
GO