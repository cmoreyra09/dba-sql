/*

    RANK :

        Asigna un rango a cada fila dentro de una particion de un conjunto de resultado. Las filas con valores
        iguales reciben el mismo rango, y el siguiente rango se incrementa en funcion del numero de filas iguales.


        Las funciones row_number y rank son similares. ROW_NUMBER numera todas las filas secuencialmente (1,2,3,4,5)
        RANK proporciona el mismo valor numerico para empates por ejemplos 1,2,2,4,5


*/


-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


-- Consultar la Tabla Sales.SalesTerritory
SELECT * FROM Sales.SalesTerritory
GO


-- ROW_NUMBER con ORDER BY
SELECT Name, CountryRegionCode, [Group],
		ROW_NUMBER() OVER(ORDER BY Name) AS RowNumber,
		RANK() OVER(ORDER BY Name) AS Rank1,
		RANK() OVER(ORDER BY [Group]) AS Rank2
FROM Sales.SalesTerritory
GO

--  ROW_NUMBER con PARTITION BY y ORDER BY
SELECT Name, CountryRegionCode, [Group],
		ROW_NUMBER() OVER(PARTITION BY [Group] ORDER BY Name) AS RowNumber,
		RANK() OVER(PARTITION BY [Group] ORDER BY Name) AS [Rank1],
		RANK() OVER(PARTITION BY [Group] ORDER BY CountryRegionCode) AS [Ran2]
FROM Sales.SalesTerritory
GO