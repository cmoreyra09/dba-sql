/*

    SYSDATETIME :
        
        Devieñve im vañpr datetime2(7) que cotiene la fecha y hora del equipo en el que la 
        instancia de SQL server se esta ejecutando.



    SYSDATETIMEOFFSET :

        Devuelve un valor datetimeoffset(7) que contiene la fecha y hora del equipo en el que la
        instancia de SQL server se esta ejecutando. El ajuste de zona horaria esta incluido.


    
    SYSUTCDATETIME  :

        Devuelve un valor datetime2 que contiene la fecha y hora de equipo en el que la instancia
        SQL server se esta ejecutando la fecha y hora se devuelven como una hora universal coordinada
        (UTC)



*/


SELECT 
    SYSDATETIME(), 
    SYSDATETIMEOFFSET(), 
    SYSUTCDATETIME()
GO