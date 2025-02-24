


/*

    DATENAME : Devuelve una cadena de caracteres que represnta el parametro datepart especificado del argumento
    date.

    DATEPART : Devuelve un entero que representa el parametro datepart especificado del parametro date especificado.

    DATETRUN : Devuelve una fecha de entrada truncada a un datepart especificado.

    DAY     :   Devuelve un entero que representa el dia del mes del argumento date especificado.

    MONTH   :   Devuelve un entero que representa la parte del mes de la fecha date especificada.

    YEAR    :   Devuelve un entero que representa la parte del año del parametro date especificado.


    En el siguiente se especifica todos los argumentos validos de datepart

    dateparte   Abreviaturas


*/




-- Funciones DATENAME, DATEPART, DATETRUNC, DAY, MONTH y YEAR
DECLARE @fecha DATETIME2 = '2024-07-07 11:30:15.1234567'
SELECT 'Year', DATENAME(year, @fecha);
SELECT 'Quarter', DATENAME(quarter, @fecha);
SELECT 'Month', DATENAME(month, @fecha);
SELECT 'dayofyear', DATENAME(dayofyear, @fecha);
SELECT 'Day', DATENAME(day, @fecha);
SELECT 'Week', DATENAME(week, @fecha);
SELECT 'weekday', DATENAME(weekday, @fecha);
SELECT 'Hour', DATENAME(hour, @fecha);
SELECT 'Minute', DATENAME(minute, @fecha);
SELECT 'Second', DATENAME(second, @fecha);
SELECT 'Millisecond', DATENAME(millisecond, @fecha);
SELECT 'Microsecond', DATENAME(microsecond, @fecha);
SELECT 'nanosecond', DATENAME(nanosecond, @fecha);
SELECT 'tzoffset', DATENAME(tzoffset, @fecha);
SELECT 'Iso_week', DATENAME(iso_week, @fecha);
GO


-- Funci�n DATEPART
DECLARE @fecha DATETIME2 = '2024-07-07 11:30:15.1234567'
SELECT 'Year', DATEPART(year, @fecha);
SELECT 'Quarter', DATEPART(quarter, @fecha);
SELECT 'Month', DATEPART(month, @fecha);
SELECT 'dayofyear', DATEPART(dayofyear, @fecha);
SELECT 'Day', DATEPART(day, @fecha);
SELECT 'Week', DATEPART(week, @fecha);
SELECT 'weekday', DATEPART(weekday, @fecha);
SELECT 'Hour', DATEPART(hour, @fecha);
SELECT 'Minute', DATEPART(minute, @fecha);
SELECT 'Second', DATEPART(second, @fecha);
SELECT 'Millisecond', DATEPART(millisecond, @fecha);
SELECT 'Microsecond', DATEPART(microsecond, @fecha);
SELECT 'nanosecond', DATEPART(nanosecond, @fecha);
SELECT 'tzoffset', DATEPART(tzoffset, @fecha);
SELECT 'Iso_week', DATEPART(iso_week, @fecha);
GO



-- Funci�n DATETRUNC
DECLARE @fecha DATETIME2 = '2024-07-07 11:30:15.1234567'
SELECT 'Year', DATETRUNC(year, @fecha);
SELECT 'Quarter', DATETRUNC(quarter, @fecha);
SELECT 'Month', DATETRUNC(month, @fecha);
SELECT 'DayOfYear', DATETRUNC(dayofyear, @fecha);
SELECT 'Day', DATETRUNC(day, @fecha);
SELECT 'Week', DATETRUNC(week, @fecha);
SELECT 'Hour', DATETRUNC(hour, @fecha);
SELECT 'Minute', DATETRUNC(minute, @fecha);
SELECT 'Second', DATETRUNC(second, @fecha);
SELECT 'Millisecond', DATETRUNC(millisecond, @fecha);
SELECT 'Microsecond', DATETRUNC(microsecond, @fecha);
SELECT 'Iso_week', DATETRUNC(iso_week, @fecha);
GO



-- Funci�n DAY
DECLARE @fecha DATETIME2 = '2024-07-07 11:30:15.1234567'
SELECT 'Day', DAY(@fecha);
GO



-- Funci�n MONTH
DECLARE @fecha DATETIME2 = '2024-07-07 11:30:15.1234567'
SELECT 'Month', MONTH(@fecha);
GO



-- Funci�n YEAR
DECLARE @fecha DATETIME2 = '2024-07-07 11:30:15.1234567'
SELECT 'Year', YEAR(@fecha);
GO