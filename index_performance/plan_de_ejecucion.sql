
/*


    Que es un plan de ejecucion :


    Un plan de ejecuon es una representacion grafica de los distintos pasos que intervienen en la obtencion de resultados
    de las tablas de la base de datos. Una ves que se ejecuta una consulta, el motor de procesamiento de consultas genera rapidamente 
    varios planes de ejecucion y selecciona el que devuelve los resultados con el mejor rendimiento.


    Plan de ejecucion estimado (Display Estimated Execution Plan) :

    Esto se genera antes que se haya ejecutado antes de la consulta.

    Plan de ejecucion real (Include Actual Execution Plan) : 

    Es una represtancion sistematica de iconos que infiere el proceso de ejecucion de la query


    -- (1) Table Scan :

            Es malo 

                Porque esta recorriendo toda la tabla para encontrar un dato y ello indica un bajo rendimiento 

        

        Imaginemos que queremos encontrar un tema especifico en un libro sin utilizar el indice. En este caso, tendriamos que revisar cada pagina del libro
        de manera secuencial hasta dar con el tema deseado. De manera similiar, un table Scan Indica que el motor de base de datos debe leer toda la tabla completa
        sin utilizar un indice adecuado , ya sea porque no existe o no es util en ese contexto. Esta operacion suele ser menos eficiente la mayor parte del tiempo.


    Los iconos se representan con dos flechas que indican paralelismo, esto quiere decir que se ha devidido la carga de trabajo en paralelo por los varios de procesadores segun el servidor.




    -- (2) Clustered Index Scan

        Similiar al table Scan, pero en este caso la tabla tiene un indice clustered que organiza previamente los datos en un 
        orden especifico. Esto significa que ahora se recorren los datos ya ordenados. Sim embargo, a pesar de estar ordenados
        ,sigue siendo un proceso lento recorre todo el indice.


    -- (3) NonClustered Index Scan (Bueno)

        Dado que los datos no pueden ser ordenados fisicamente en disco, ya que esto lo ha realizado el indice
        clustered, se genera una estructura adicional con las columnas a indexar, y estas columnas se organizan de manera
        ordenada. Si la consulta solo utiliza esta estructura del indice sin acceder directamente a las paginas de datos,aunque no sea 
        un metodo perfecto es mas eficiente que un Table Scan o un Clustered Index SCAN.

    -- (4) Clustered Index Seek

        Este metodo si es eficiente. Es similar a buscar en un diccionario que esta organizado alfabeticamente. Si queremos encontrar la palabra zanahoria
        no empezamos desde la primera pagina que contiene palabras con la letra A en su lugar iremos directamente hacia el final, donde se encuentran las palabras que empiezan
        con la letra Z.

    -- (5) NonClustered Index Seek 

        Este es el uso ideal de un indice NonClustered. El concepto es parecido a buscar un tema en un libro :

            concepto es parecido a buscar un tema en un libro acudimos al indice de las primeras paginas para encontrar rapidamente las secciones donde se encuentra la informacion
            que necesitamos.
    
    -- (6) Stream Aggregate 

        Ocurre cuando organizamos los datos en grupos y utilizamos funciones de agregaciones como MIN, SUM, AVG,o cuando empleamos la clausula HAVING.


    -- (7) Order BY:

        Cuando el motor de base de datos debe ordenar los resultados por un campo que no esta previamente ordenado por un indice, necesita realizar una operacion de ordenacion, 
        lo que generalmente reduce el rendimiento de la consulta.

    -- (8) Nested Loop Join : (JOINS)

        Tenemos dos conjuntos de datos : uno esta preordenado y contiene elementos unicos, mientras que el otro no. Usando el conjunto ordenado y de elementos unicos como referencia.
        se selecciona el primer elemento y se busca una coincidencia en cada elemento del segundo conjunto, recorriendo todo sus elementos porque no esta ordenado. Al finalizar, se procede
        con el segundo elemento del conjunto ordenado. Es posible que se vuelva a encontrar el primer elemento y que ocurra una nueva coincidencia con el segundo, debido a que el conjunto orginal
        ya estaba previamente ordenado.

    -- (9) MergeJoin :(Join)

        Este operador es el mas eficiente de los joins, ya que ambos conjuntos de datos estan ordeandos. Esto permite realizar una busqueda mas rapida en el segund oconjunto cada 
        elemento del primer conjunto busca coincidir con los items del segundo, y una vez que no hay mas coincidencias, ya no es necesario recorrer toda la tabla para cada elemento
        del primer conjunto

    -- (10) Hash Join

        Este tipo es menos eficiente, ya que al no haber un orden valido a traves de indices en ninguna de las dos tablas o conjuntos de datos es decir no hay indices en ninguna tabla
        el sistema debe crear una tabla temporal ordenada para reemplazar uno de los conjuntos y luego simular un join similar al nested loop join.


    -- (11)



*/