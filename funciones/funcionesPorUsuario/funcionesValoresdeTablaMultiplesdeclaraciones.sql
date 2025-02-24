-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


/*-------------------------------------------------------------------
		CREAMOS LA FUNCI�N DE TABLA(M�ltiples Declaraciones)
--------------------------------------------------------------------*/
CREATE OR ALTER FUNCTION Lista_Empleados_HorasVacaciones(@hora SMALLINT) 
RETURNS @Lista TABLE(BusinessEntityID INT, JobTitle NVARCHAR(50),
					 HireDate DATE, VacationHours SMALLINT)
AS 
BEGIN
	INSERT INTO @LISTA
	SELECT BusinessEntityID, JobTitle, HireDate, VacationHours
	FROM HumanResources.Employee
	WHERE VacationHours <= @hora

	RETURN
END
GO


/*------------------------------------------------
	Consultar todas las columnas mediante SELECT
--------------------------------------------------*/
SELECT *
FROM Lista_Empleados_HorasVacaciones(50)
ORDER BY VacationHours DESC
GO


/*------------------------------------------------
	Consultar algunas columnas mediante SELECT
--------------------------------------------------*/
SELECT BusinessEntityID, JobTitle, HireDate, VacationHours  
FROM Lista_Empleados_HorasVacaciones(50)
ORDER BY VacationHours DESC
GO