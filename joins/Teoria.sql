/*

    Tipos de Joins :

        Permiten combinar datos de 2 o mas tablas.


    En bases de datos relacionales, como SQL server, Oracle, MySQL y otras, los datos se almacenan en varias tablas que estan relacionadas entre si
    con un valor de clave comun. En consecuencia, existe una necesidad constante de extraer registros de dos o mas tablas en una tabla de resultados
    en funcion de alguna condicion. 

    En SQL server, esto se puede lograr facilmente con la clausula JOIN.


    JOIN es una clausula SQL que utiliza para consultar y acceder a datos de varias tablas, basandose en relaciones logicas entre esas tablas.


    En otras palabras, joins indica como sql server debe utilizar los datos de una tabla para seleccionar las filas de otra tabla.



    Todo parte del producto cartesiano:

        Un producto cartesiano es el resultado de una combinacion de todas las filas de dos tablas, esto significa que cada fila de la primera t abla
        se combina con cada fila de la segunda tabla,generando un numero de filas en el resultado que es el producto del numero de filas de ambas tablas.



    INNER JOIN : 
        Inicia con el producto cartesiano; aplica el filtro para que coincidan con filas entre cuadros basados en predicado.

    OUTER JOIN :
        Inicia el producto cartesiano; todas las filas de la tabla designada se conservan, igualando filas de otra tabla recuperada.

    CROSS JOIN :
        Combina todas las filas de ambas tablas.

    SELF JOIN  : 
        Inicia con el producto cartesiano; aplica el filtro y es una tecnica en la cual una tabla se une consigo misma.



    Sintaxis :

    SQL-92 (SINTAXIS RECOMENDADA)
    A partir de SQL-92, se introdujo una forma más clara y segura de hacer JOINs, evitando productos cartesianos accidentales.

    Ejemplo en SQL-92 (Forma recomendada):


    SELECT *
    FROM Table1
    INNER JOIN Table2 ON Table1.ID = Table2.ID;
    
    Beneficios de SQL-92:

    Más claro y legible: Se separa la lógica de unión (JOIN ON) de los filtros (WHERE).
    Evita productos cartesianos: Si se olvida la condición en WHERE, en SQL-89 la consulta se ejecuta incorrectamente. 
    En SQL-92, si no hay una condición en ON, el JOIN no se ejecuta correctamente.
    Mayor compatibilidad con otros tipos de JOIN (LEFT JOIN, RIGHT JOIN, FULL JOIN).


    SQL - 89
    SELECT *
    FROM Table1, Table2
    WHERE Table1.ID = Table2.ID;

    Explicación de SQL-89 JOIN Syntax
    En ANSI SQL-89, la forma de unir tablas era simplemente listándolas en la cláusula FROM, 
    separadas por comas, y aplicando la condición de unión en la cláusula WHERE.

    Ejemplo en SQL-89:

    SELECT *
    FROM Table1, Table2
    WHERE Table1.ID = Table2.ID;
        Problema: Si se omite la condición en WHERE, se genera un producto cartesiano, es decir, 
        cada fila de Table1 se combinará con todas las filas de Table2, lo que puede generar resultados inesperados o consultas poco eficientes.



*/

