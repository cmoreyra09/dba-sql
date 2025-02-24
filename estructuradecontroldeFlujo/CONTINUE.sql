/*

    Continue : 

    La isntruccion CONTINUE reinicia un bucle WHILE. Se omiten todas las instrucciones despues de la instruccion 
    CONTINUE. CONTINUE es frecuente, pero no siempre, abierto por instruccion IF.

*/


-- Puedes ubicarte en cualquier Base de Datos

/*
Escribe un script que sume los numeros del 1 al 20,
pero omite los multiplos de 5 utilizando CONTINUE.
*/
DECLARE @contador SMALLINT = 1
DECLARE @suma SMALLINT = 0

WHILE @contador <= 20
BEGIN
    IF @contador % 5 = 0
    BEGIN
        SET @contador = @contador + 1
        CONTINUE -- Omitir los m�ltiplos de 5
    END

    SET @suma = @suma + @contador
    SET @contador = @contador + 1;

END

PRINT 'La suma de los numeros del 1 al 20, excepto los m�ltiplos de 5, es: ' + CAST(@suma AS VARCHAR(6));
GO



-- Ejercicio Propuesto
/*
Escribe un script que multiplique los n�meros del 1 al 10,
pero omite el numero 5 utilizando CONTINUE.
*/
DECLARE @contador INT = 1
DECLARE @producto INT = 1

WHILE @contador <= 10
BEGIN
    IF @contador = 5
    BEGIN
        SET @contador = @contador + 1
        CONTINUE -- Omitir el numero 5
    END

    SET @producto = @producto * @contador
    SET @contador = @contador + 1
END

PRINT 'El producto de los numeros del 1 al 10, excepto el 5, es: ' + CAST(@producto AS VARCHAR(10))
GO