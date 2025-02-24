

/*


    Funciones que establecen o devuelven funciones de formatos de sesion :



    SET DATEFORMAT :

        Establece el orden de las partes correspondientes al mes dia y año de una fecha
        para interpretar las cadenas de caracteres de fecha para la sesion actual

    
    sp_helplanguage :

        Es un procedimiento almacenado de la tabla sys.syslanguages que nos muestra informacion sobre
        un lenguaje alternativo determinado o sobre todo los lenguajes de SQL server


    SET LENGUAGE :

        Establece el idioma de la sesion actual. esto establece la opcion SET DATEFORMAT de forma implicita.

    
    @@LANGUAGE :

        Devuelve el nombre del idioma actual de la sesion



*/




-- Funciones SET DATEFORMAT, sp_helplanguage, SET LANGUAGE y @@LANGUAGE
-- SET DATEFORMAT
SET DATEFORMAT dmy
GO

SELECT '01/01/2024' AS fecha
GO



-- Procedimiento almacenado 'sp_helplanguage'
EXEC sp_helplanguage;

EXEC sp_helplanguage English;

SELECT * FROM sys.syslanguages;

SELECT * FROM sys.syslanguages
WHERE alias = 'English';
GO



-- SET LANGUAGE
SET LANGUAGE 'English';
SELECT '01/01/2024' AS fecha,
		DATENAME(weekday, '01/01/2024') AS nombre;
GO

SET LANGUAGE 'Spanish';
SELECT '01/01/2024' AS fecha,
		DATENAME(weekday, '01/01/2024') AS nombre;
GO



-- @@LANGUAGE
SELECT @@LANGUAGE AS Idioma
GO