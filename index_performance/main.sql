/*

    Index (Indice) :

    Recuperar datos de una base de datos de una manera mas rapida.

    El indexar una tabla es sin lugar a dudas, una de las mejores opciones de poder mejorar el rendimiento de las
    consultas y aplicaciones.

    Un indice SQL es una tabla de busqueda rapida para poder encontrar los registros que los usuarios necesitan buscar
    con mayor frecuencia. Ya que un indice es pequeño, rapido y optimizado para busquedas rapidas. Ademas,que son muy utiles para 
    conectar las tablas relacionadas y la busqueda en tablas grandes



    Si hacemos una consulta a la tabla, lo que hara es recorrer toda la tabla para devolver todas las filas


    Indice Agrupado (CLUSTERED INDEX) :

    El indice agrupado define el orden en el que se ordenaran y almacenaran los datos de la tabla en disco.

    Cuando define un indice agrupado en una columna ordenara los datos segun los valores de esa columna y los almacenara
    Solo se puede haber un indice agrupado en una tabla.


    Cuando crea la llave primaria en una tabla, se crea automaticamente un indice agrupado unico en la tabla.


    Indice No Agrupado (NONCLUSTERED INDEX) :

    El indice no agrupado no ordena fisicamente las filas de datos en el disco.

    Crea una estructura clave-valor separada de los datos de la tabla donde la clave contiene los valores de las columnas
    y cada valor contiene un puntero a la fila de datos que contiene el valor real


    Pude haber 999 indices no agrupados en una sola tabla.

    Cuando crea una restriccion UNIQUE, se crea un indice unico no agrupado en la tabla.

    
    


*/