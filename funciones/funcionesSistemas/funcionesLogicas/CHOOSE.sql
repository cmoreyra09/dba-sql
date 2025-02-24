/*

    Devuelve el elemento en el indice especificado de una lista de valores


    El argumento de index especifica que debemos de pasarlo a entero.

    Sintaxis :


    CHOOSE(Index,val,val,val)


*/




SELECT CHOOSE ( 3, 'Python', 'Redes', 'SQL Server', 'C#' ) AS Curso; -- SQL Server

SELECT CHOOSE ( 4, 100, 200, 300, 400, 500) AS Numero; -- 400

SELECT CHOOSE ( 0, 'Python', 'Redes', 'SQL Server', 'C#' ) AS Curso; -- NULL

SELECT CHOOSE ( 1, '') AS Item; -- Vacio
SELECT CHOOSE ( 2, '') AS Item; -- NULL

SELECT CHOOSE ( 1, NULL) AS Item; -- NULL