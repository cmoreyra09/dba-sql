/*

    RETURN : 

    La instruccion RETURN sale incondicionalmente de una consulta o procedimiento. Return es inmediata
    y completa y se puede utilizar en cualquier punto para salir de un procedimiento lote o bloque
    de instrucciones. Las instrucciones que sigue a RETURN no se ejecutan.




*/


/*
Escribe un script que sume los numeros del 1 al 20,
pero cuando la suma sea mayor a 100 debe de terminar el procedimiento.
*/

DECLARE @contador SMALLINT = 1
DECLARE @suma SMALLINT = 0

WHILE @contador <= 20
BEGIN
    IF @suma > 100
    BEGIN
		PRINT 'La suma total mayor a 100 es: ' + CAST(@suma AS VARCHAR(6));
        RETURN -- Omitir los m�ltiplos de 5
    END

    SET @suma = @suma + @contador
    SET @contador = @contador + 1;

END
GO