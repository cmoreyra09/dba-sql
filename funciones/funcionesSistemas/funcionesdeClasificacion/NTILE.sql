/*

    NTILE :

        Distribuye las filas de una particion ordenada en un numero especifico de grupos . Los grupos estan 
        numerados, empezando por el uno. Para cada fila, NTILE devuelve el numero del grupo al que pretecene la fila


*/






-- ROW_NUMBER con ORDER BY
SELECT Name, CountryRegionCode, [Group],
		ROW_NUMBER() OVER(ORDER BY Name) AS RowNumber,
		RANK() OVER(ORDER BY Name) AS Rank1,
		RANK() OVER(ORDER BY [Group]) AS Rank2,
		DENSE_RANK() OVER(ORDER BY [Group]) AS DenseRank,
		NTILE(5) OVER(ORDER BY [Group]) AS [NTile] -- 1, 2, 3 ...
FROM Sales.SalesTerritory
GO

-- ROW_NUMBER con PARTITION BY y ORDER BY
SELECT Name, CountryRegionCode, [Group],
		ROW_NUMBER() OVER(PARTITION BY [Group] ORDER BY Name) AS RowNumber,
		RANK() OVER(PARTITION BY [Group] ORDER BY Name) AS [Rank1],
		RANK() OVER(PARTITION BY [Group] ORDER BY CountryRegionCode) AS [Ran2],
		DENSE_RANK() OVER(PARTITION BY [Group] ORDER BY CountryRegionCode) AS DenseRank,
		NTILE(3) OVER(PARTITION BY [Group] ORDER BY CountryRegionCode) AS [NTile] -- 1, 2, 3 ...
FROM Sales.SalesTerritory
GO