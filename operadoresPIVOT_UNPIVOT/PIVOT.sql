USE AdventureWorks2022
GO




		/* Realizar el calculo de las ventas totales por Año */
		






		SELECT 
			'AverageCost' AS CostosTotales,
			[2011],
			[2012],
			[2013],
			[2014]
			--INTO Testing
				FROM (
					SELECT 
						YEAR(SO.OrderDate) AS SalesYear,
						SO.SubTotal AS Totales
							FROM Sales.SalesOrderHeader AS SO
								INNER JOIN Sales.SalesOrderDetail AS SOD ON SO.SalesOrderID = SOD.SalesOrderID
		) AS sourceTable
			
			PIVOT(

			AVG(Totales) 
				FOR SalesYear IN ([2011],[2012],[2013],[2014])
		
		) AS PivotTable;


        --		CTE
WITH cte_yearSales
AS
(
	SELECT YEAR(SOH.OrderDate) as SalesYear,
		SOH.SubTotal as TotalSales
	FROM sales.SalesOrderHeader SOH JOIN sales.SalesOrderDetail SOD 
		ON SOH.SalesOrderId = SOD.SalesOrderId
)
SELECT * FROM cte_yearSales
PIVOT 
(
	SUM(TotalSales)
	FOR SalesYear 
	IN ([2011], [2012], [2013], [2014])
) AS PVT
GO
