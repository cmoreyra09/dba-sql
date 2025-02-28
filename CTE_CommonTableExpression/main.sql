

/*

    CTE (Common Table Expression) :

        Una CTE, en español expresiones de tablas comunes son un conjunto de resultados temporales que se devuelven una unica
        declaracion para su posterior uso dentro de la misma declaracion. Como se trata de un resultado temporal,
        no se almacena en ningun lugar y no consume espacio en disco . Sim embargo, se puede hacer referencia a el de la misma manera
        que a cualquier tabla.



        o bien, podemos considerar una CTE como una especie de tabla virtual que contiene columnas con registros fisicos. Esta tabla virtual
        se crea como resultado de la ejecucion de la consulta, es utilizada por otra consulta y se elimina despues de la ejecucion de la consulta 
        principal.

        Desde la introduccion desde la version de SQL server 2025 las CTE se han convertido en un metodo popular para los especialistas
        en bases de datos que las aplican para hacer que las consultas complejas sean mas faciles de leer y mantener.


    Caracteristicas :

        Definicion Temporal : 
            Una CTE se define temporalmente para una unica consulta y deja de existir una ves se complete

        Facilidad la legibilidad : 

            Permite estructura el query de forma sistematica

        Uso Recursivo :

            Lo que permite ejecutar jeraquia o graficos



    Sintaxis :

        WITH 
            -- Nombre Tabla --
                AS ()


*/