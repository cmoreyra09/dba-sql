


/*

    DATEADD :

        Agregar un intervalo de tiempo a una fecha (año, trimestre,mes,dia,semana,hora,minut.etc)


        SINTAXIS :

            DATEADD(datepart,number,date)


            El argumento dateparte especifica a la fecha a la que DATEADD agrega un numero int

            El argumento number es una epresion de un tipo de dato int y su valor puede ser positivo
            o negativo.

    
    EOMONTH :

        Devuelve el ultimo dia del mes que contiene la fecha especificada, con un desplazamiento opcional.




*/



-- Funciones DATEADD y EOMONTH
-- DATEADD
DECLARE @fechaActual DATETIME2 = CURRENT_TIMESTAMP;
SELECT 'Year',		  @fechaActual, DATEADD(year,        4, @fechaActual);
SELECT 'Quarter',	  @fechaActual, DATEADD(quarter,     4, @fechaActual);
SELECT 'Month',		  @fechaActual, DATEADD(month,      13, @fechaActual);
SELECT 'DayOfYear',	  @fechaActual, DATEADD(dayofyear, 365, @fechaActual);
SELECT 'Day',		  @fechaActual, DATEADD(day,	   365, @fechaActual);
SELECT 'Week',		  @fechaActual, DATEADD(week,        5, @fechaActual);
SELECT 'WeekDay',	  @fechaActual, DATEADD(weekday,    31, @fechaActual);
SELECT 'Hour',		  @fechaActual, DATEADD(hour,       23, @fechaActual);
SELECT 'Minute',	  @fechaActual, DATEADD(minute,     59, @fechaActual);
SELECT 'Second',	  @fechaActual, DATEADD(second,     59, @fechaActual);
SELECT 'Millisecond', @fechaActual, DATEADD(millisecond, 1, @fechaActual);
SELECT 'Microsecond', @fechaActual, DATEADD(microsecond, 3, @fechaActual);
SELECT 'Nanosecond',  @fechaActual, DATEADD(nanosecond, 17, @fechaActual);
GO




DECLARE @fechaActual DATETIME2 = CURRENT_TIMESTAMP;
SELECT 'Year',		  @fechaActual, DATEADD(year,        -4, @fechaActual);
SELECT 'Quarter',	  @fechaActual, DATEADD(quarter,     -4, @fechaActual);
SELECT 'Month',		  @fechaActual, DATEADD(month,      -13, @fechaActual);
SELECT 'DayOfYear',	  @fechaActual, DATEADD(dayofyear, -365, @fechaActual);
SELECT 'Day',		  @fechaActual, DATEADD(day,	   -365, @fechaActual);
SELECT 'Week',		  @fechaActual, DATEADD(week,        -5, @fechaActual);
SELECT 'WeekDay',	  @fechaActual, DATEADD(weekday,    -31, @fechaActual);
SELECT 'Hour',		  @fechaActual, DATEADD(hour,       -23, @fechaActual);
SELECT 'Minute',	  @fechaActual, DATEADD(minute,     -59, @fechaActual);
SELECT 'Second',	  @fechaActual, DATEADD(second,     -59, @fechaActual);
SELECT 'Millisecond', @fechaActual, DATEADD(millisecond, -1, @fechaActual);
SELECT 'Microsecond', @fechaActual, DATEADD(microsecond, -3, @fechaActual);
SELECT 'Nanosecond',  @fechaActual, DATEADD(nanosecond, -17, @fechaActual);
GO



-- Funci�n EOMONTH
DECLARE @fechaActual DATETIME2 = CURRENT_TIMESTAMP;
SELECT @fechaActual, EOMONTH(@fechaActual); -- Del mes en curso
SELECT @fechaActual, EOMONTH(@fechaActual, 1); -- Del mes +1
SELECT @fechaActual, EOMONTH(@fechaActual, -1); -- Del mes menos 1
GO