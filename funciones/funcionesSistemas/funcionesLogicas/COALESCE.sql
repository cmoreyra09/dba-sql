/*

    COALESCE : 

        Devuelve el tipo de datos con la prioridad mas alta es decir, devuelve el primer valor no nulo de 
        una lista

        Sintaxis : 
        COALESCE(val1,val2,...,val_n)


    El argumento val_n especifica una lista de valores separados por comas de cualquier tipo de datos.


*/



SELECT COALESCE(NULL, 100, 200, 'No Disponible') AS Resultado; --100

SELECT COALESCE(NULL, 200, 100, 'No Disponible') AS Resultado; --200

SELECT COALESCE(NULL, 'No Disponible', 100, 200) AS Resultado; --Error deben ser del mismo tipo de dato

SELECT COALESCE(NULL, 'Hugo', 'Paco', 'Luis') AS Resultado; -- Hugo