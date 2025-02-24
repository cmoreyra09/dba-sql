/*

    BREAK :

    La instruccion break sale del bucle WHILE actual. Si el bucle WHILE actual esta anidado dentro de otro
    , BREAK Solo sale del bucle actual y se proporciona el control a la siguiente instruccion del bucle exterior.

*/



/*

	Escribe un script que imprima los numeros del 1 al 10
	utilizando un bucle WHILE

	Si el contador alcanza el valor de 5 se debe de salir del bucle usando BREAK


*/


BEGIN TRANSACTION

	DECLARE @contador AS TINYINT SET @contador = 1


	WHILE @contador < 10
	BEGIN
		
		PRINT @contador

		IF @contador = 5
			BREAK
	
		SET @contador = @contador + 1
	
	END

COMMIT TRANSACTION
GO


/*

	Escribe un script que sume los numeros impares de 1 al 20 utilizando un bucle while
	Si la suma supera el valor 50, se debe salir del bucle usando break.

*/


BEGIN TRANSACTION 

	DECLARE @contador	 AS TINYINT SET @contador	 = 1
	DECLARE @sumaImpares AS INT		SET @sumaImpares = 0

	WHILE @contador < 21
	BEGIN
		IF @contador % 2 <> 0
		BEGIN
			SET @sumaImpares =+ @contador
		END
		
		IF @sumaImpares > 50
		BEGIN
			PRINT 'La suma ha superado el limite de 50.'
			BREAK
		END
		SET @contador = @contador + 1
	END

PRINT CONCAT('La suma de los numeros impares del 1 al 20 es de : ',CAST(@sumaImpares AS VARCHAR(10)))

COMMIT TRANSACTION
GO