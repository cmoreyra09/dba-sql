/*

	Las intrucciones BEGIN y END se utilizan para delimitar un bloque de instrucciones SQL que deben ser tratadas como una sola unidad
	las intrucciones begin y end ayudan a organizar el codigo y asegurar que todas las intrucciones dentro del bloque se ejecuten
	de manera secuencial y como parte de la misma transaccion logica.


*/

BEGIN
	PRINT 'Hola Mundo' -- Mensajes
	PRINT 'Hola Mundo3' -- Mensajes
	SELECT 'Hola Mundo3' -- Filas
END 
GO



BEGIN
	DECLARE @1			AS TINYINT			SET @1 = 1
	DECLARE @2			AS TINYINT			SET @2 = 2
	DECLARE @Resultado	AS TINYINT			SET @Resultado = @1 +@2
	DECLARE @Salida		AS NVARCHAR(50)		SET @Salida  = CONCAT('El resultado es de: ', @Resultado)
	
	PRINT @Salida

END
GO

/*

Bloque de ejecucion Anidado:


*/




BEGIN
	PRINT 'Bloque de ejecucion Padre'

	DECLARE @numero TINYINT SET @numero = 10

	BEGIN
		PRINT 'Bloque de ejecucion Hijo'

		DECLARE @numero1 TINYINT SET @numero1 = 9
		PRINT @numero
		PRINT @numero1
	END


END
GO