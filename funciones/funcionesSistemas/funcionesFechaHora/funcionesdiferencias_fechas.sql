

/*

    Funciones para calcular la diferencia de fecha y hora


    DATEDIFF : 
        Devuelve la diferencia entre dos fechas, devolviendo el resultado en la unidad especificada,
        Devuelve el resultado en un valor tipo int.


    Sintaxis:

        DATEDIFF(datepart,startdate,endate)


    DATEDIFF_BIG :

        Esta funcion es similar a DATEDIFF pero devuelve el resultado en un valor tipo de datos bigint
        para manejar diferencias muy grandes.

    
    Sintaxis:

        DATEDIFF_BIG(datepart,startdate,endate)



*/





-- Funciones DATEDIFF y DATEDIFF_BIG
-- DATEDIFF
DECLARE @fechaInicio DATETIME2 = '2023-12-31 23:59:59.9999999'
DECLARE @fechaFin DATETIME2 = '2025-01-01 00:00:00.0000000'
SELECT 'Year',		  DATEDIFF(year,        @fechaInicio, @fechaFin);
SELECT 'Quarter',	  DATEDIFF(quarter,     @fechaInicio, @fechaFin);
SELECT 'Month',		  DATEDIFF(month,       @fechaInicio, @fechaFin);
SELECT 'DayOfYear',   DATEDIFF(dayofyear,   @fechaInicio, @fechaFin);
SELECT 'Day',		  DATEDIFF(day,         @fechaInicio, @fechaFin);
SELECT 'Week',		  DATEDIFF(week,        @fechaInicio, @fechaFin);
SELECT 'Hour',		  DATEDIFF(hour,        @fechaInicio, @fechaFin);
SELECT 'Minute',	  DATEDIFF(minute,      @fechaInicio, @fechaFin);
SELECT 'Second',	  DATEDIFF(second,      @fechaInicio, @fechaFin);
SELECT 'Millisecond', DATEDIFF(millisecond, @fechaInicio, @fechaFin);
SELECT 'Microsecond', DATEDIFF(microsecond, @fechaInicio, @fechaFin);
SELECT 'Nanosecond',  DATEDIFF(nanosecond,  @fechaInicio, @fechaFin);
SELECT 'Bytes', DATALENGTH(DATEDIFF(year,   @fechaInicio, @fechaFin)); -- Espacio en Bytes que ocupa
GO



-- DATEDIFF_BIG
DECLARE @fechaInicio DATETIME2 = '2023-12-31 23:59:59.9999999'
DECLARE @fechaFin DATETIME2 = '2025-01-01 00:00:00.0000000'
SELECT 'Year',		  DATEDIFF_BIG(year,        @fechaInicio, @fechaFin);
SELECT 'Quarter',	  DATEDIFF_BIG(quarter,     @fechaInicio, @fechaFin);
SELECT 'Month',		  DATEDIFF_BIG(month,       @fechaInicio, @fechaFin);
SELECT 'DayOfYear',   DATEDIFF_BIG(dayofyear,   @fechaInicio, @fechaFin);
SELECT 'Day',		  DATEDIFF_BIG(day,         @fechaInicio, @fechaFin);
SELECT 'Week',		  DATEDIFF_BIG(week,        @fechaInicio, @fechaFin);
SELECT 'Hour',		  DATEDIFF_BIG(hour,        @fechaInicio, @fechaFin);
SELECT 'Minute',	  DATEDIFF_BIG(minute,      @fechaInicio, @fechaFin);
SELECT 'Second',	  DATEDIFF_BIG(second,      @fechaInicio, @fechaFin);
SELECT 'Millisecond', DATEDIFF_BIG(millisecond, @fechaInicio, @fechaFin);
SELECT 'Microsecond', DATEDIFF_BIG(microsecond, @fechaInicio, @fechaFin);
SELECT 'Nanosecond',  DATEDIFF_BIG(nanosecond,  @fechaInicio, @fechaFin);
SELECT 'Bytes', DATALENGTH(DATEDIFF_BIG(year,   @fechaInicio, @fechaFin)); -- Espacio en Bytes que ocupa
GO