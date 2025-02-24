-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


-- Consultar la Tabla Sales.SalesTerritory
SELECT * FROM Sales.SalesTerritory
GO


/*
Utilizar la Tabla SalesTerritory y resolver lo siguiente:
Mostrar las columnas TerritoryID, Name y SalesYTD
Contar la cantidad de registros
Obtener las Ventas(SalesYTD) m�nimas y redondear con dos decimales
Obtener las Ventas(SalesYTD) m�ximas y redondear con dos decimales
Obtener la Suma de las Ventas(SalesYTD) y redondear con dos decimales
Obtener el Promedio de las Ventas(SalesYTD) y redondear con dos decimales
*/
SELECT TerritoryID, Name, SalesYTD,
		COUNT(1) OVER() [Count],
		ROUND( MIN(SalesYTD) OVER(), 2 ) AS [Min],
		ROUND( MAX(SalesYTD) OVER(), 2 ) AS [Max],
		ROUND( SUM(SalesYTD) OVER(), 2 ) AS [Sum],
		ROUND( AVG(SalesYTD) OVER(), 2 ) AS [Avg]
FROM Sales.SalesTerritory
GO



-- Consultar la Tabla HumanResources.Employee
SELECT * FROM HumanResources.Employee
GO

/*
Utilizar la Tabla Employee y resolver lo siguiente:
Mostrar las columnas JobTitle y VacationHours
Agregar otra columna llamada 'RankVacationHours'
que va a clasificar por las Horas de Vacaciones(VacationHours)
De manera Descendente
*/
SELECT JobTitle, VacationHours,
		ROW_NUMBER() OVER(ORDER BY VacationHours DESC) AS RankVacationHours
FROM HumanResources.Employee
GO



-- Consultar la Tabla Person.Address
SELECT * FROM Person.Address
GO

/*
Utilizar la Tabla Address y resolver lo siguiente:
Mostrar las columnas AddressLine1 y City
Luego clasificar la Direcci�n(AddressLine1) de manera Ascendente
dividido por la Ciudad(City)
*/
SELECT AddressLine1, City,
		RANK() OVER(PARTITION BY City ORDER BY AddressLine1) AS [Rank],
		DENSE_RANK() OVER(PARTITION BY City ORDER BY AddressLine1) AS [DenseRank]
FROM Person.Address
GO