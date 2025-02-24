/*

    Devuelve un valor NULL si las dos expresiones especificadas son iguales. De lo contrario devuelve la primera expresion.


    Si los valores que se coloquen son iguales retornara NULL

*/



SELECT NULLIF(25, 25) AS Resultado;

SELECT NULLIF(50, 25) AS Resultado;

SELECT NULLIF('Hola', 'Hola') AS Resultado;

SELECT NULLIF('Hola', 'Mundo') AS Resultado;