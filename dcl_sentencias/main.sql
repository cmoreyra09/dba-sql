/*


    Setnencias DCL:


        En SQL Server DCL es un conjunto de instrucciones SQL utilizadas para controla el acceso a los datos
        dentro de una base de datos. Su principal objetivo es gestionar los permisos y privilegios que tienen 
        los usuarios o roles para realizar ciertas acciones en los objetos de la base de datos, como tablas,
        vistas procedimientos almacenados,etc.






    GRANT : 

        Otorga permisos especificos a un usuario o rol para realizar acciones a la base de datos.

    REVOKE :

        Revoca o quita permisos previamente otorgados a un usuario o rol.

    DENY :

        Niega explicitamente permisos a un usuario o rol, incluso si el permiso fue otorgado anteriormente.



    Consideraciones a tener : 

        Seguridad : 
            
            Las instrucciones DCL son fundamentales para garantizar la seguridad de la base de datos, ya que 
            limitan que acciones puede realizar cada usuario o rol.
        
        Jerarquia :

            La instruccion DENY tiene prioridad sobre GRANT. Si un permiso es negado con DENY, el usuario
            no podra realizar la accion, aunque tenga permisos otorgados.



    Resumen : 

        La instruccion DCL son esenciales para el control de acceso y la administracion de la seguridad en sql
        asegurando que solo los usuarios autorizados puedan interactura con los datos de manera adecuada.


*/