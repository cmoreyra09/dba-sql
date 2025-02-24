

/*

    IIF

        Devuelve uno de dos valores, dependiendo de si la expresion booleana se evalua como true o como false.

*/


DECLARE @n1 INT = 45, @n2 INT = 40;

SELECT IIF( @n1 > @n2, 'TRUE', 'FALSE' ) AS Resultado; -- TRUE

SELECT IIF( @n1 > @n2, NULL, NULL ) AS Resultado; -- ERROR