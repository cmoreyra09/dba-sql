-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


-- Consultar la Tabla Sales.Store
SELECT * FROM Person.EmailAddress
GO

-- Ejercicio 1
/*
	Obtener solo los usuarios de la columna eamil adrres


*/


SELECT 
    EmailAddress,
	SUBSTRING(EmailAddress,1,CHARINDEX('@',EmailAddress)-1) AS userName,
    SUBSTRING(EmailAddress, CHARINDEX('@', EmailAddress) + 1, 
		CHARINDEX('.', EmailAddress, CHARINDEX('@', EmailAddress)) - CHARINDEX('@', EmailAddress) - 1
    ) AS Dominio
FROM Person.EmailAddress;




-- Consultar la Person.Person
SELECT * FROM Person.Person
GO

-- Ejercicio 2
/*
Realizar un script que muestre las columnas BusinessEntityID,
PersonType, Title, FirstName, MiddleName, LastName, Suffix y
tambi�n crear una nueva columna llamada "Person" donde
se van a unir los valores de las colummnas 
PersonType, Title, FirstName, MiddleName, LastName y Suffix,
teniendo en cuenta lo siguiente:
Debe haber un espacio entre la uni�n de cada columna
El valor de la columna PersonType y Title deben unirse por un gui�n(-)
El valor de la columna Title se debe mostrar en MAYUSCULA
Luego unir tambi�n la columna FirstName
Si el valor de la columna MiddleName es NULL, se debe reemplazar por ''
Si el valor de la columna MiddleName NO es NULL, se debe poner un punto al final(.)
Unir tambi�n la columna LastName y se debe mostrar en MINUSCULA
Si el valor de la columna Suffix es NULL, se debe reemplazar por ''
sino unir el valor de la columna Suffix
*/
SELECT BusinessEntityID, PersonType, Title, FirstName, MiddleName, LastName, Suffix,
		CONCAT_WS( SPACE(1), 	
			CONCAT_WS(' - ', PersonType, UPPER(title)),
			FirstName, 
			IIF(
				LEN(MiddleName) > 0,
				CONCAT(MiddleName, '.'),
				COALESCE(MiddleName, '')
			),
			LOWER(LastName),
			IIF(
				LEN(Suffix) > 0,
				Suffix,
				COALESCE(Suffix, '')
			)
		)AS Person
FROM Person.Person
GO



-- Consultar la Sales.CurrencyRate
SELECT * FROM Sales.CurrencyRate
GO

-- Ejercicio 3
/*
Realizar un script que muestre las columnas CurrencyRateID, EndOfDayRate y
tambi�n crear las siguientes columnas:
Numeric Format: va a convertir el valor de la columna EndOfDayRate
				a un formato Numeric donde la cultura sea Germany.
General Format: va a convertir el valor de la columna EndOfDayRate
				a un formato General donde la cultura sea Germany.
Currency Format: va a convertir el valor de la columna EndOfDayRate
				a un formato Currency donde la cultura sea Germany.
Ordenar de manera Ascendente por la columna CurrencyRateID
*/
SELECT CurrencyRateID, EndOfDayRate  
      ,FORMAT(EndOfDayRate, 'N', 'de-de') AS 'Numeric Format'  
      ,FORMAT(EndOfDayRate, 'G', 'de-de') AS 'General Format'  
      ,FORMAT(EndOfDayRate, 'C', 'de-de') AS 'Currency Format'  
FROM Sales.CurrencyRate  
ORDER BY CurrencyRateID
GO