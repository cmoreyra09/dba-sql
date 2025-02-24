/*

	Variables :

	Las variables son objetos de almacenamiento temporal que pueden contener datos y se utilizan dentro de un batch o lote de instrucciones. 
	Las variables son esenciales para programacion en T-SQL porque permiten almacenar datos, realizar calculos y controlar el flujo de ejecucion.


	Las variables se pueden crear para diferentes tipos de datos y tambien se les pueden asignar valores. Ademas, los valores asignados a las variables
	se pueden cambiar durante el periodo de ejecucion. El ciclo de vida de la variable comienza desde el punto en el que se declara y debe finalizar del batch o lote de instrucciones.


	Las variables son siempre locales dentro del batch o lote de instruccion en el que se declara.


	sintaxis :

	DECLARE @NOMBRE_VARIABLE TIPO_DATO 
	SET @NOMBRE_VARIABLE = VALOR


*/



/* 
	Crear variables para tu nombre, el pais donde naciste y su capital luego como salida debe tener el siguiente mensaje :
	YO (name) soy del paise (nameCountry) y su capita (cityCountry)

*/


DECLARE @name		VARCHAR(5)  SET @name	 = 'Carlos'
DECLARE @country	VARCHAR(4)  SET @country = 'Peru'
DECLARE @capital	VARCHAR(4)	SET @capital = 'Lima'

PRINT 'Mi nombres es ' + @name  +' el pais donde vivo es ' + @country + ' y su ciudad es '+@capital
GO



DECLARE @edad		TINYINT		SET @edad		= 40
DECLARE @nombre		VARCHAR(20) SET @nombre		= 'Carlos'
DECLARE @apellido	VARCHAR(20) SET @apellido	= 'Moreyra'

PRINT @edad

PRINT @nombre 

PRINT @apellido

GO



/*

	Mediante el uso de variable se requiere consultar los empleados (Employees)
	donde su nombre (FirstName) empiece por la letra 'M'

*/

	DECLARE @nameTarget	AS NVARCHAR(50) SET @nameTarget = 'M%'
	
	SELECT * FROM Employees
		WHERE FirstName LIKE @nameTarget
		GO




-- Nota Importante : Las variables solo se puede ejecutar al batch o al bloque de instruccion que pertecene.