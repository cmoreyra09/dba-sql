/*

    Sub :

         - Que algo depende de algo
         - Que algo esta debajo de algo
         - que algo esta dentro de algo

    Consultas:
        
        - La consultas es una instruccion escrita en el lenguaje SQL



    Una subconsulta es una consulta anidada dentro de otra consulta SQL

    Los resultados de la consulta interna pasan a la consutla externa y la consulta interna actua como una expresion
    desde la perspectiva de la consulta externa.


    Las subconsultas pueden devolver un unico valor, una lista de valores o un conjunto de completo de resultados y se utilizan
    en diversas clausulas de la consulta principal como SELECT, FROM, WHERE, HAVING y Otras.


    Son utiles para realizar consultas mas complejas y especificas permitiendo la reutilizacion de resultados de una consulta en otra.



    Las subconsultas pueden ser autonomas o correlacionadas


        - Las consultas autonomas se ejecutan por separado
        - Las consultas correlacionadas dependen de los valores de la consulta externa.


    Existen dos tipos de principales de subconsultas:

        (1) - Subconsultas Escalares  : Devuelven un solo valor y suelen usarse en clausulas SELECT o WHERE

        (2) - Subconsultas multivalor : Devuelven multiples filas o columnas y pueden utilizarse con operadores
        como IN, ALL, EXISTS, entre otros. 



*/