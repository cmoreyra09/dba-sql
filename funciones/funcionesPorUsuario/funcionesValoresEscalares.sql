-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


/*-----------------------------------------
		CREAMOS LA FUNCI�N ESCALAR
------------------------------------------*/
CREATE OR ALTER FUNCTION Cantidad_Empleados_EstadoCivil(@MaritalStatus CHAR(1)) 
RETURNS INT 
AS 
BEGIN

          DECLARE @cantidad_empleado INT;

		  /*
          SET @cantidad_empleado = (
									SELECT COUNT(1) 
									FROM HumanResources.Employee 
									WHERE MaritalStatus = @MaritalStatus
									)
		  */

		  SELECT @cantidad_empleado = COUNT(1) 
		  FROM HumanResources.Employee 
		  WHERE MaritalStatus = @MaritalStatus

          RETURN @cantidad_empleado;

END
GO


/*-----------------------------------------
	Consultamos mediante SELECT
------------------------------------------*/
SELECT dbo.Cantidad_Empleados_EstadoCivil('M') AS Cantidad
GO


/*------------------------------------------------------
	Asignamos a una Variable, Alteramos y Consultamos
-------------------------------------------------------*/
DECLARE @CantidadDoble INT = 0
SET @CantidadDoble = dbo.Cantidad_Empleados_EstadoCivil('M') * 2
SELECT @CantidadDoble AS Cantidad
GO


/*---------------------------------------------------
	Cremos una Funci�n con m�ltiples par�metros
----------------------------------------------------*/
CREATE OR ALTER FUNCTION Calcular_Pitagoras(@cateto_a FLOAT, @cateto_b FLOAT) 
RETURNS FLOAT 
AS 
BEGIN

          DECLARE @hipotenusa FLOAT;

          SET @hipotenusa = SQRT( POWER(@cateto_a, 2) + POWER(@cateto_b, 2) )

          RETURN @hipotenusa; 

END
GO



/*-----------------------------------------
	Consultamos mediante SELECT
------------------------------------------*/
SELECT dbo.Calcular_Pitagoras(6, 8) AS Resultado
GO