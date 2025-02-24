/*


    FORMAT :

        La funcion FORMAT devuelve un valor con el formato y la referencia culturarl opcional especificados.

        La funcion FORMAT se utiliza para aplicar formato especificado de la configuracion regional de los valores
        de fecha/hora y de numero como cadenas.

    FORMAT(value,format[,culture])

*/



-- Funcion Format

SET DATEFORMAT dmy
GO

-- Formato sencillo
DECLARE @date DATE = '22/11/2024';
SELECT FORMAT( @date, 'd', 'en-US' ) 'US English'  
      ,FORMAT( @date, 'd', 'en-gb' ) 'British English'  
      ,FORMAT( @date, 'd', 'de-de' ) 'German'  
      ,FORMAT( @date, 'd', 'zh-cn' ) 'Chinese Simplified (PRC)';

  
SELECT FORMAT( @date, 'D', 'en-US' ) 'US English'  
      ,FORMAT( @date, 'D', 'en-gb' ) 'British English'  
      ,FORMAT( @date, 'D', 'de-de' ) 'German'  
      ,FORMAT( @date, 'D', 'zh-cn' ) 'Chinese Simplified (PRC)';
GO



-- Formato con cadena personalizado
DECLARE @date DATE = '22/11/2024';
SELECT FORMAT( @date, 'dd/MM/yyyy', 'en-US' ) AS 'Date'  
       ,FORMAT(123456789,'###-##-####') AS 'Custom Number';
GO




-- Formato con tipos num�ricos
-- Cultura Estados Unidos
DECLARE @n1 DECIMAL(5,4) = 1.0002
SELECT @n1,
		FORMAT(@n1, 'N', 'en-us') AS 'Numeric Format',
		FORMAT(@n1, 'G', 'en-us') AS 'General Format',
		FORMAT(@n1, 'C', 'en-us') AS 'Currency Format'
GO

-- Cultura Alemana
DECLARE @n1 DECIMAL(5,4) = 1.0002
SELECT @n1,
		FORMAT(@n1, 'N', 'de-de') AS 'Numeric Format',
		FORMAT(@n1, 'G', 'de-de') AS 'General Format',
		FORMAT(@n1, 'C', 'de-de') AS 'Currency Format'
GO