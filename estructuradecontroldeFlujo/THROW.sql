

/*

    THROW:

    La instruccion THROW es una instruccion utilizada para generar explicitamente un error desde una seccion de
    codigo Transact - SQL. Se puede usar para generar errores personalizados o para relanzar errores capturados en un bloque
    CATCH de una estructura TRY..CATCH

*/


-- Puedes ubicarte en cualquier Base de Datos

-- Utilizar la instrucci�n THROW
THROW 50001, 'Ha ocurrido un error', 10
GO


-- Utilizar la instrucci�n THROW en el ejemplo del cap�tulo anterior
BEGIN TRY
	DECLARE @numero INT = 'Texto'
END TRY
BEGIN CATCH
	PRINT('No es posible asignar un valor de cadena a un tipo de dato entero.');
 	THROW 50001, 'Ha ocurrido un error', 10
END CATCH
GO


-- Utilizar la instrucci�n THROW sin Argumentos
BEGIN TRY
	DECLARE @numero INT = 'Texto'
END TRY
BEGIN CATCH
	PRINT('No es posible asignar un valor de cadena a un tipo de dato entero.');
 	THROW
END CATCH
GO