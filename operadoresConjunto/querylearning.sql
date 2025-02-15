/*

Operadores de conjunto :

    Los operadores de conjuntos se utilizan para combinar dos o mas datos similares presentes en uno, dos o mas bases de datos
    SQL, fusionan el resultado obtenido.

    Operadores de Conjunto para utilizar en las sentencias DML

    (1) UNION
    (2) UNION ALL
    (3) INTERSECT
    (4) EXCEPT


*/


-- (1) Operador de Conjunto "UNION"

/*
Descripcion :

    Combina los resultados de dos o mas consultas en un unico conjunto de resultados distinto que incluye todas las filas
    que pertenecen a todas las consultas de la union.

    En esta operacion combina dos o mas conjuntos de filas y elimina los duplicados

*/



/* Unir sin duplicados los paises de la tabla clientes y empleados */

SELECT Country FROM Customers
UNION
SELECT Country FROM Employees


-- (2) Operador de Conjunto "UNION ALL" 

/*
Descripcion :

    Combina los resultados de dos o mas consultas en un unico conjunto de resultados distinto que incluye todas las filas que pertenecen
    a todas las consultas de la union all

    En esta operacion , combina dos o mas conjuntos de filas y mantiene duplicados.

*/

/* Unir con duplicados los paises de la tabla clientes y empleados */
SELECT Country FROM Employees
UNION ALL
SELECT Country FROM Customers


-- (3) Operador de Conjunto "INTERSECT"

/*
    El operador de Intersect mantiene las filas que son comunes a todas las consultas 
*/


/* INTERSECARSE los paises de la tabla clientes y empleados */
SELECT Country FROM Customers
INTERSECT
SELECT Country FROM Employees


-- (4) Operador de Conjunto "EXCEPT"

/*

    Muestra los registros que la pimera tabla tiene y la segunda no tiene


*/

/* Mostrar los paises de la tabla clientes  y que no esten en la tabla empleados  */

-- Muestra todo de employes pero la coincidencia de customers quita los paises en employees

SELECT DISTINCT Country FROM Customers
EXCEPT
SELECT DISTINCT Country FROM Employees