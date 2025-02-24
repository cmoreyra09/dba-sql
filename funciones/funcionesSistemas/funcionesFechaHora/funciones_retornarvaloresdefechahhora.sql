/*


    TIMEFROMPARTS :

        Devuelve un valor time para la hora especificada y con la precision indicada.

    
    Sintaxis

        TIMEFROMPARTS(hour,minute,seconds,fractions,precisions)



    DATEFROMPARTS:

        Devuelve un valor date que se asigna a los valores de año mes y dia especificado.

    
    Sintaxis
        DATEFROMPARTS(year,month,day)



    SMALLDATETIMEFROMPARTS:

        Devuelve un valor smalldatetime de la fecha y la hora especificada.

    
    Sintaxis:
        SMALLDATETIMEFROMPART(year,month,day,hour,minute)


    DATETIMEFROMPARTS:

        Devuelve el valor daetime para los argumentos de fecha y hora especificados.

    Sintaxis:
    
    DATETIMEFROMPARTS(year,month,day,hour,minute,seconds,miliseconds)


    DATETIME2FROMPARTS:

        Devuelve un valor datetime2 para los argumentos de fecha y hora especificados.
        El valor devuelto tiene una precision especificada por el argumento precision.

    DATETIME2FROMPARTS(year,month,day,hour,minute,seconds,fractions,precision)


    DATETIME2FROMPARTS:

        Devuelve un valor datetimeoffset para los argumentos de fecha y hora especificados.
        El valor devuelto tiene una precision especificada por el argumento precision y un 
        desplazamiento especificado por los argumentos de desplazamiento.


    DATETIME2FROMPARTS(year,month,day,hour,minute,seconds,fractions,hour_offset,minute_offset,precision)
        


*/


-- Podemos estar ubicados en cualquier Base de Datos

/*
Funciones TIMEFROMPARTS, DATEFROMPARTS,SMALLDATETIMEFROMPARTS 
		  DATETIMEFROMPARTS, DATETIME2FROMPARTS y DATETIMEOFFSETFROMPARTS
*/

-- TIMEFROMPARTS( hour, minute, seconds, fractions, precision )
SELECT TIMEFROMPARTS( 14, 23, 44, 5, 1 );
SELECT TIMEFROMPARTS( 14, 23, 44, 50, 2 );
SELECT TIMEFROMPARTS( 14, 23, 44, 500, 3 );
GO



-- DATEFROMPARTS( year, month, day ) 
SELECT DATEFROMPARTS( 2024, 12, 31 );
GO



-- SMALLDATETIMEFROMPARTS( year, month, day, hour, minute )
SELECT SMALLDATETIMEFROMPARTS( 2024, 12, 31, 14, 23 );
GO



-- DATETIMEFROMPARTS( year, month, day, hour, minute, seconds, milliseconds )
SELECT DATETIMEFROMPARTS( 2024, 12, 31, 14, 23, 30, 0 );
SELECT DATETIMEFROMPARTS( 2024, 12, 31, 14, 23, 30, 3 );
SELECT DATETIMEFROMPARTS( 2024, 12, 31, 14, 23, 30, 7 );
SELECT DATETIMEFROMPARTS( 2024, 12, 31, 14, 23, 30, 10 );
SELECT DATETIMEFROMPARTS( 2024, 12, 31, 14, 23, 30, 13 );
SELECT DATETIMEFROMPARTS( 2024, 12, 31, 14, 23, 30, 17 );
GO



-- DATETIME2FROMPARTS( year, month, day, hour, minute, seconds, fractions, precision )
SELECT DATETIME2FROMPARTS( 2024, 12, 31, 14, 23, 30, 0, 0 );  
SELECT DATETIME2FROMPARTS( 2024, 12, 31, 14, 23, 30, 5, 1 );  
SELECT DATETIME2FROMPARTS( 2024, 12, 31, 14, 23, 30, 50, 2 );  
SELECT DATETIME2FROMPARTS( 2024, 12, 31, 14, 23, 30, 500, 3 ); 
GO



-- DATETIMEOFFSETFROMPARTS( year, month, day, hour, minute, seconds, fractions, hour_offset, minute_offset, precision )
SELECT DATETIMEOFFSETFROMPARTS( 2024, 12, 31, 14, 23, 30, 0, 12, 0, 7 );
SELECT DATETIMEOFFSETFROMPARTS( 2024, 12, 31, 14, 30, 30, 5, 12, 30, 1 );  
SELECT DATETIMEOFFSETFROMPARTS( 2024, 12, 31, 14, 30, 30, 50, 12, 30, 2 );  
SELECT DATETIMEOFFSETFROMPARTS( 2024, 12, 31, 14, 30, 30, 500, 12, 30, 3 );  
GO  