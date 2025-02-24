
/*


    TRY .. CATCH

    La instruccion de control de errores TRY ... CATCH se utiliza para manejar errores de manera
    controlada dentro de bloques codigo T-SQL. Esta estructura permite capturar y manejar eorres sin detener.

    La ejecucion del script, proporcionando un mecanismo similar las excepciones en otros lenguajes de programacion.

*/



-- Puedes ubicarte en cualquier Base de Datos

-- Dividir 50/2
SELECT 50/2
GO
--PRINT 50/2
--GO


-- Dividir 50/0
SELECT 50/0
GO
--PRINT 50/0
--GO


-- Dividir 50/0 utilizando TRY...CATCH
BEGIN TRY
	PRINT 50/0 -- Con otro divisor devuelve el resultado correcto
END TRY
BEGIN CATCH
	PRINT('No es posible realizar la divisi�n entre cero.')
END CATCH
GO



-- Declarar una variable con errores
DECLARE @numero INT = 'Texto'
GO


-- Declarar una variable con errores utilizando TRY...CATCH
BEGIN TRY
	DECLARE @numero INT = 'Texto'
END TRY
BEGIN CATCH
	PRINT('No es posible asignar un valor de cadena a un tipo de dato entero.');
END CATCH
GO