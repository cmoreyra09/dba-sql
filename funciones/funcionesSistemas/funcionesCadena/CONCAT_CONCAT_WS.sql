
/*

    CONCAT : 

        Devuelve una cadena resultante de la concatenacion o la combinacion de dos o mas valores 
        de cadena de una manera integral

    
    CONCAT_WS :

        Devuelve una cadena resultante de la concatenacion o la combinacion, de dos o mas valores
        de cadena de una manera integral. Separa esos valores de cadena concatenados con el delimitador
        especificado en el primer argumento de funcion 


    CONCAT_WS Basicamente lo que realizar es que lo delimita por un separador que en este caso es : o , segun la necesidad


*/





SELECT CONCAT('Cristian ', 'Donayre ') AS Resultado
GO

SELECT 'Cristian ' + 'Donayre ' AS Resultado
GO

SELECT CONCAT('Navidad ', 'es: ', 25, '/', '12') AS Resultado
GO


SELECT CONCAT_WS( ' : ', 'Curso', 'SQL Server') AS Resultado
GO

SELECT CONCAT_WS( '.', 'www', 'udatademy', 'com') AS Resultado
GO