/*

    ROW_NUMBER:


        Devuelve la clasificacion de cada fila dentro de una particion del conjunto de resultados, da el rango uno para la 
        primera fila y luego imcrementa el valor en uno para cada fila. Tambien obtenemos diferentes rangos para la fila
        que tiene valores similares.


*/



BEGIN TRANSACTION 
	
	BEGIN TRY
	
		SELECT  
			S.Name,
			S.CountryRegionCode,
			S.[Group],
			ROW_NUMBER() OVER(PARTITION BY S.[Group] ORDER BY S.Name) AS RowNumber
			FROM Sales.SalesTerritory AS S

	END TRY

	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		PRINT ERROR_LINE()
		PRINT ERROR_SEVERITY() 
		PRINT ERROR_NUMBER()
	END CATCH


COMMIT TRANSACTION
GO