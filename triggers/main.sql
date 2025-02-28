

/*

	Un trigger es un objeto de base de datos que se ejecuta automaticamente cuando se produce un evento especifico en una tabla o vista
	Los triggers se utilizan comunmente para implementar logica empresarial adicional, como validar datos antes de ser insertados o actualizarlos
	, mantener la integridad referencial o realizar auditorias de cambios en los datos.



    Una ves que se activan, los triggers pueden realizar una variedad de funciones, como la modificacion de datos en la misma tabla o en otras tablas,
    la aplicacion de restricciones y reglas de negocio y muchas mas tareas relacionadas con la gestion de datos.


    Importancia y Aplicaciones de los triggers:

        - Automatizacion de Tareas :

                Cada ves que se registra un usuario , tambien se debe de actualizar en la tabla de auditoria, un triger se encarga de hacer una inserccion en una tabla
                de los usuarios.
        
        - Integridad de datos : 
                
                Los triggers pueden aplicar reglas que protegen la integridad de los datos se puede impedir eliminar un registro cuando esta siendo 
                referenciado en otra tabla.

        - Auditoria y Registro :

                En esta caractersitica se puede ver cuando se realizao la ejecucion de los datos en vivo o historial de transacciones tambien sirve.

        - Accion en Cascada :

                Si se borra los datos en una tabla elimina los datos de la tabla referencia.



    TRIGGER DDL :

            Se ejecutan en respuesta a una variedad de eventos de lenguaje de definicion de datos (DDL). Estos eventos corresponden principalmente a instrucciones
            CREATE, ALTER y DROP DE Transact -SQL y a determinados procedimientos almacenados del sistema que se ejecutan operaciones de tipo DDL.


    TRIGGER DML :

            Se ejecutan automaticamente cuando tiene lugar un evento de lenguaje de manipulacion de datos (DML) que afecta a la tabla o la vista definida en el trigger.
            Los triggers DML incluyen las instrucciones INSERT, UPDATE o DELETE. Los triggers DML pueden usarse para aplicar reglas de negocios y la integridad de datos
            , consultar otras tablas e incluir instrucciones Transact-SQL complejas.

*/