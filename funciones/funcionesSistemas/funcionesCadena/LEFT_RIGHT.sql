/*

    LEFT :

        Devuelve la parte izquierda de una cadena de caracteres con el numero de caracteres especificados.

    RIGHT:

        Devuelve la parte derecha de una cadena de caracteres con el numero de caracteres especificado.


*/



-- LEFT
SELECT LEFT('Hola Mundo', 4)
GO

SELECT LEFT(123456789.123,8)
GO



-- RIGHT
SELECT RIGHT('Hola Mundo', 5)
GO

SELECT RIGHT(123456789.123,5)
GO