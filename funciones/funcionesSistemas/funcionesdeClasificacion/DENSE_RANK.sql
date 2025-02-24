
/*

    DENSE_RANK():

        Devuelve un numero de rango unico dentro de la particion segun el valor de columan especificado.
        Es similar a la funcion Rank una pequeña diferencia


        En la funcion DENSE_RANK(), si tenemos valores duplicados SQL tambien asigna diferentes rangos a esas filas
        Idealmente deberiamos obtener la misma clasificacion para valores duplicados o similares


*/

-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


-- Consultar la Tabla Sales.SalesTerritory
SELECT * FROM Sales.SalesTerritory
GO


-- Funci�n ROW_NUMBER con ORDER BY
SELECT Name, CountryRegionCode, [Group],
		ROW_NUMBER() OVER(ORDER BY Name) AS RowNumber,
		RANK() OVER(ORDER BY Name) AS Rank1,
		RANK() OVER(ORDER BY [Group]) AS Rank2,
		DENSE_RANK() OVER(ORDER BY [Group]) AS DenseRank
FROM Sales.SalesTerritory
GO

-- Funci�n ROW_NUMBER con PARTITION BY y ORDER BY
SELECT Name, CountryRegionCode, [Group],
		ROW_NUMBER() OVER(PARTITION BY [Group] ORDER BY Name) AS RowNumber,
		RANK() OVER(PARTITION BY [Group] ORDER BY Name) AS [Rank1],
		RANK() OVER(PARTITION BY [Group] ORDER BY CountryRegionCode) AS [Ran2],
		DENSE_RANK() OVER(PARTITION BY [Group] ORDER BY CountryRegionCode) AS DenseRank
FROM Sales.SalesTerritory
GO