/*

Sentencias DDL :

    Las sentencias DDL ( Definition Language / Lenguaje de Definicion de Datos ) son un conjunto
    de comandos utilizados para definir, modificar y gestionar estructura de una base de datos.

    
    Estas sentencias se utilizan para crear, modificar y eliminar objetos en la base de datos, como
    tablas, indices, vistas, restricciones y otros elementos que definen la organizacion y la 
    estructura de los datos en un sistema de administracion de bases de datos Relacionales (RDBMS)


Las sentecias DDL Son : 

CREATE TABLE  (1)

    - Se utilizan para crear nuevos objetos en la base de datos. Estos objetos pueden ser tablas
    ,vistas, indices, procedimientos almacenados, funciones y otros elementos que forman parte de la 
    estructura de la base de datos.


ALTER  (2)

    - La sentencial ALTER se utiliza para modificar la estructura de objetos ya existentes en la 
    base de datos, como agregar, eliminar o modificar columnas de una tabla, cambiar nombre de un objeto.


DROP (3)

    - La sentencia DROP se utiliza para eliminar objetos de la base de datos, como tablas, vistas o
    indices.

    Tener en cuenta que esta accion es irreversible y elimina permanentemente los datos asociados.


    DROP [TIPO_OJBETO] IF EXISTS [NOMBRE OBJETO]

TRUNCATE (4) 

    - La sentencia TRUNCATE elimina todas las filas de una tabla o particiones especificas de una tabla
    sin registrar las eliminaciones de filas individuales.

    TRUNCATE es similiar a la declaracion DELETE sin al clausula WHERE ; Sim embargo, TRUNCATE es mas rapido
    y utiliza menos recursos del sistema y del registro de transacciones.




---


Cuando se Crea una base de datos.

Se crean 2 archivos MDF y LDF



bd_charge.MDF 
    
    - Contiene toda la informacion principal sobre la base de datos, en este archivo se encuentra :
        objetos de las tablas, fuciones , sp , vistas , etc.

bd_charge.ldf

    - Se encuentra los registros de transacciones, estos registros de transacciones ayudan al servidor a identificar actividades relacionadas
    con respecto al cambio, asi como identificar donde esta el error.


Se crear una base de datos utilizando una sentencia DDL


CREATE DATABASE bd_charge


*/