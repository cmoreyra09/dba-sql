

/*

    Funciones de fecha y hora del sistema de precision Baja


    CURRENT_TIMESTAMP :

        Esta funcon devuelve la marca de tiempo del sistema de bvase de datos actual como un valor datetime
        asin el desplazamiento de zona horaria  de la base de datos.

        CURRENTE_TIMESTAMP deriva este valor del sistema operativo del equipo en el que se ejecuta la instancia
        SQL Server.



    GETDATE() :


        Devuelve la marca de tiempo del sistema de base de datos actual como un valor datetime sin el desplazamiento de zona horaria
        de la base de datos. 
        
        Este valor se deriva del sistema operativo del equipo donde la instancia SQL Server se esta ejecutando.


    GETUTCDATE():


        Devuelve la marca de tiempo del sistema de la base de datos actual como un valor datetime.
        el ajuste de zona horaria de la base de datos no esta incluido  este valor representa la hora
        UTC actual (Hora universal coordinada)



*/





SELECT 
	CURRENT_TIMESTAMP, 
	GETDATE(), 
	GETUTCDATE()
GO