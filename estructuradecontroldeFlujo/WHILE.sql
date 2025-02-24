/*
	WHILE :

		La instruccion WHILE se utiliza para ejecutar un bloque de codigo repetidamente mientras una condicion
		especificada sea verdadera. Es una estructura de control de flujo que permite la ejecucion de bucles, lo cual
		es util para realizar tareas repetitivas hasta que se cumpla una determinada condicion.


*/

BEGIN TRANSACTION

DECLARE @tablaMultiplicar AS INT          SET @tablaMultiplicar = 1;
DECLARE @targetNumber	  AS INT		  SET @targetNumber	    = 12;
DECLARE @resultado		  AS NVARCHAR(50);

WHILE @tablaMultiplicar <= @targetNumber
	BEGIN

		SET @resultado = '7 x ' + CAST(@tablaMultiplicar AS VARCHAR(2)) + ' = ' + CAST(7 * @tablaMultiplicar AS VARCHAR(5));		
		PRINT @resultado 
		
		SET @tablaMultiplicar = @tablaMultiplicar + 1;
	END


COMMIT TRANSACTION
GO

/*
	
	Realizar el select correspondiente que vaya hasta la categoria Id 8

*/

BEGIN TRANSACTION

	DECLARE @contador AS TINYINT SET @contador =  1;
	DECLARE @target	  AS TINYINT SET @target   =  8;

	WHILE @contador <= @target
		BEGIN
			SELECT * FROM Categories WHERE CategoryID = @contador
			SET @contador = @contador + 1
		END

COMMIT TRANSACTION
GO



-- Puedes ubicarte en cualquier Base de Datos

/*
Utilizando el bucle WHILE debes mostrar
los n�meros del 1 al 10
*/
DECLARE @contador INT
SET @contador = 1

WHILE @contador <= 10
BEGIN
	PRINT('El valor de la Variable Contador es: ' + CAST( @contador AS VARCHAR(10) ) )
	-- SET @contador = @contador + 1
	SET @contador += 1
END
GO



/*
Calcular la Suma de los n�meros PARES 
del 1 hasta el valor que le asignemos a una variable.
*/
DECLARE @numero INT = 10
DECLARE @contador INT = 1
DECLARE @suma INT = 0

WHILE @contador <= @numero
BEGIN
    IF @contador % 2 = 0
    BEGIN
		-- SET @suma = @suma + @contador
        SET @suma += @contador
    END
    -- SET @contador = @contador + 1
	SET @contador += 1
END

PRINT('La suma de los n�meros pares del 1 al ' + CAST(@numero AS VARCHAR(10)) + 
		' es: ' + CAST(@suma AS VARCHAR(10)))
GO



