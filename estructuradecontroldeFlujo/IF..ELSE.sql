/*

IF ... ELSE
La instruccion IF se ejecuta si se cumple la condicion cuando la expresion booleana devuelve TRUE. La palabra clave opcional ELSE presenta otra instruccion
que se ejecuta cuando no se cumple la condicion IF entonces la expresion booleana devuelve FALSE



*/

/*
	Crear una variable edad y le debes de asginar un valor para mostrar un mensaje indicando si es mayor o menor de edad.

	Nota : Para ser mayor de edad debes de tener una edad mayor o igual a 18 años.


*/

BEGIN TRANSACTION -- Si se coloca el begin transaction no es necesario cerrarlo con END
	
	DECLARE @Edad			AS TINYINT			SET @Edad			= 20
	DECLARE @MayorEdad		AS TINYINT			SET @MayorEdad		= 18
	DECLARE @Output_18		AS NVARCHAR(20)		SET @Output_18		= 'Es mayor de 18 Años'
	DECLARE @Outputless18	AS NVARCHAR(20)		SET @Outputless18	= 'Es menor de 18 años'
	
	BEGIN 
		IF @Edad >= @MayorEdad
			PRINT @Output_18
		ELSE
			PRINT @Outputless18
	END

	PRINT 'Finalizacion de ejercicio'
GO




/* 

	Crear dos variables venta y bono, 
	si las ventas son mayores a 20,000 el bono es 500
	si las ventas son mayores a 50,000 el bono es 900

	De lo contrario el bono es 100

*/


BEGIN TRANSACTION 
	DECLARE @InputVenta		AS INT			SET @InputVenta = 30000
	DECLARE @Ventas1		AS INT			SET @Ventas1	= 20000
	DECLARE @Ventas2		AS INT			SET @Ventas2	= 50000
	DECLARE @Bono100		AS SMALLINT		SET @Bono100	= 100
	DECLARE @Bono500		AS SMALLINT		SET @Bono500	= 500
	DECLARE @Bono900		AS SMALLINT		SET @Bono900	= 900


	IF @InputVenta > @Ventas2
	BEGIN
		PRINT CONCAT('Ustede recibe un bono de: ',@Bono900)
	END
		ELSE 
			IF @InputVenta > @Ventas1
		BEGIN 
			PRINT CONCAT('Usted recibe un bono de: ', @Bono900)
		END
			ELSE
			BEGIN
			PRINT CONCAT('Usted recibe un bono de: ', @Bono100)
			END

COMMIT TRANSACTION
GO

/*
	
	Crear una variable llamado caracter de tipo char(1)

	la cual va aceptar un valor de la letra  a hasta la e
	y dependiendo de la letra asignada se debe mostrar el siguiente mensaje:


	A = Argentina
	B = Brazil
	C = Colombia
	D = Dinamarca
	E = Ecuador

*/


BEGIN TRANSACTION

	DECLARE @Country		AS CHAR(1)	   SET @Country			= 'A'
	DECLARE @Argentina		AS VARCHAR(10) SET @Argentina		= 'Argentina'
	DECLARE @Brazil			AS VARCHAR(10) SET @Brazil			= 'Brazil'
	DECLARE @Colombia		AS VARCHAR(10) SET @Colombia		= 'Colombia'
	DECLARE @Dinamarca		AS VARCHAR(10) SET @Dinamarca		= 'Dinamarca'
	DECLARE @Ecuador		AS VARCHAR(10) SET @Ecuador			= 'Ecuador'
	DECLARE @Error			AS VARCHAR(50) SET @Error			= 'Pais no Encontrado en la lista.'
	
	IF @Country = 'A'
		BEGIN
			PRINT CONCAT('El pais elegido es: ',@Argentina)
		END
		
	ELSE IF @Country = 'B'
		BEGIN
			PRINT CONCAT('El pais elegido es: ',@Brazil)
		END

	ELSE IF @Country = 'C'
		BEGIN
			PRINT CONCAT('El pais elegido es: ',@Colombia)
		END
	
	ELSE IF @Country = 'D'
		BEGIN
			PRINT CONCAT('El pais elegido es: ',@Dinamarca)
		END

	ELSE IF @Country = 'E'
		BEGIN
			PRINT CONCAT('El pais elegido es: ',@Ecuador)
		END
	
	ELSE PRINT @Error

COMMIT TRANSACTION 
GO