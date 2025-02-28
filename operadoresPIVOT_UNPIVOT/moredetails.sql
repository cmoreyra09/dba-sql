-- Ubicarnos en la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


/*
Realizar el c�lculo de las ventas totales por A�o
*/
--		Subconsulta
SELECT SalesYear,
		TotalSales
FROM
(
	SELECT * FROM 
	(
		SELECT YEAR(SOH.OrderDate) as SalesYear,
			SOH.SubTotal as TotalSales
		FROM sales.SalesOrderHeader SOH INNER JOIN sales.SalesOrderDetail SOD 
			ON SOH.SalesOrderId = SOD.SalesOrderId
	) AS Sales
	PIVOT 
	(
		SUM(TotalSales)
		FOR SalesYear 
		IN ([2011], [2012], [2013], [2014])
	) AS PVT
) AS T
UNPIVOT
(
	TotalSales
	FOR SalesYear
	IN ([2011], [2012], [2013], [2014])
) AS UPVT
GO


--		CTE
WITH cte_yearSales
AS
(
	SELECT YEAR(SOH.OrderDate) as SalesYear,
		SOH.SubTotal as TotalSales
	FROM sales.SalesOrderHeader SOH JOIN sales.SalesOrderDetail SOD 
		ON SOH.SalesOrderId = SOD.SalesOrderId
),
cte_pvtYearSales
AS
(
	SELECT * FROM cte_yearSales
	PIVOT 
	(
		SUM(TotalSales)
		FOR SalesYear 
		IN ([2011], [2012], [2013], [2014])
	) AS PVT
)
SELECT SalesYear,
		TotalSales
FROM cte_pvtYearSales
UNPIVOT
(
	TotalSales
	FOR SalesYear
	IN ([2011], [2012], [2013], [2014])
) AS UPVT
GO







/*
Obtener las ventas Trimestrales por A�o
*/
--		Subconsulta
SELECT SalesYear,
		Quarters AS [Quarter],
		TotalSales
FROM
(
	SELECT SalesYear, 
		   ISNULL([Q1], 0) AS Q1, 
		   ISNULL([Q2], 0) AS Q2, 
		   ISNULL([Q3], 0) AS Q3, 
		   ISNULL([Q4], 0) AS Q4, 
		   (ISNULL([Q1], 0) + ISNULL([Q2], 0) + ISNULL([Q3], 0) + ISNULL([Q4], 0)) SalesYTD
	FROM
	(
		SELECT YEAR(SOH.OrderDate) AS SalesYear, 
			   CAST('Q'+CAST(DATEPART(QUARTER, SOH.OrderDate) AS VARCHAR(1)) AS VARCHAR(2)) Quarters, 
			   SOH.SubTotal AS TotalSales
		FROM sales.SalesOrderHeader SOH INNER JOIN sales.SalesOrderDetail SOD 
			ON SOH.SalesOrderId = SOD.SalesOrderId
	 ) AS Data 
	 PIVOT
	 (
		SUM(TotalSales) 
		FOR Quarters 
		IN([Q1], [Q2], [Q3], [Q4])
	) AS pvt
) AS T
UNPIVOT
(
	TotalSales
	FOR Quarters
	IN ([Q1], [Q2], [Q3], [Q4])
) AS UPVT
ORDER BY SalesYear
GO


--		CTE
WITH cte_quarterSales
AS
(
    SELECT YEAR(SOH.OrderDate) AS SalesYear, 
           CAST('Q'+CAST(DATEPART(QUARTER, SOH.OrderDate) AS VARCHAR(1)) AS VARCHAR(2)) Quarters, 
           SOH.SubTotal AS TotalSales
    FROM sales.SalesOrderHeader SOH INNER JOIN sales.SalesOrderDetail SOD 
		ON SOH.SalesOrderId = SOD.SalesOrderId
),
cte_pvtQuarterSales
AS
(
	SELECT SalesYear, 
		   ISNULL([Q1], 0) AS Q1, 
		   ISNULL([Q2], 0) AS Q2, 
		   ISNULL([Q3], 0) AS Q3, 
		   ISNULL([Q4], 0) AS Q4, 
		   (ISNULL([Q1], 0) + ISNULL([Q2], 0) + ISNULL([Q3], 0) + ISNULL([Q4], 0)) SalesYTD
	FROM cte_quarterSales
	PIVOT 
	(
		SUM(TotalSales)
		FOR Quarters 
		IN ([Q1], [Q2], [Q3], [Q4])
	)
	AS pvt
)
SELECT SalesYear,
		Quarters AS [Quarter],
		TotalSales
FROM cte_pvtQuarterSales
UNPIVOT
(
	TotalSales
	FOR Quarters
	IN ([Q1], [Q2], [Q3], [Q4])
) AS UPVT
ORDER BY SalesYear
GO







/*
Obtener las ventas Mensuales por A�o
*/
--		Subconsulta
SELECT SalesYear,
		Months AS [Month],
		TotalSales
FROM
(
	SELECT SalesYear, 
		   ISNULL([1], 0) AS Jan, 
		   ISNULL([2], 0) AS Feb, 
		   ISNULL([3], 0) AS Mar, 
		   ISNULL([4], 0) AS Apr, 
		   ISNULL([5], 0) AS May, 
		   ISNULL([6], 0) AS Jun, 
		   ISNULL([7], 0) AS Jul, 
		   ISNULL([8], 0) AS Aug, 
		   ISNULL([9], 0) AS Sep, 
		   ISNULL([10], 0) AS Oct, 
		   ISNULL([11], 0) AS Nov, 
		   ISNULL([12], 0) AS Dec, 
		   (ISNULL([1], 0) + ISNULL([2], 0) + ISNULL([3], 0) + ISNULL([4], 0) + ISNULL([4], 0) + 
			ISNULL([5], 0) + ISNULL([6], 0) + ISNULL([7], 0) + ISNULL([8], 0) + ISNULL([9], 0) + 
			ISNULL([10], 0) + ISNULL([11], 0) + ISNULL([12], 0)) SalesYTD
	FROM
	(
		SELECT YEAR(SOH.OrderDate) AS SalesYear, 
			   DATEPART(MONTH, SOH.OrderDate) Months,
			   SOH.SubTotal AS TotalSales
		FROM sales.SalesOrderHeader SOH INNER JOIN sales.SalesOrderDetail SOD 
			ON SOH.SalesOrderId = SOD.SalesOrderId
	 ) AS Data 
	 PIVOT
	 (
		SUM(TotalSales) 
		FOR Months 
		IN([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])
	) AS pvt
) AS T
UNPIVOT
(
	TotalSales
	FOR Months
	IN ([Jan], [Feb], [Mar], [Apr], [May], [Jun],
		[Jul], [Aug], [Sep], [Oct], [Nov], [Dec])
) AS UPVT
ORDER BY SalesYear, Months
GO


--		CTE
WITH cte_monthSales
AS
(
    SELECT YEAR(SOH.OrderDate) AS SalesYear, 
           DATEPART(MONTH, SOH.OrderDate) Months,
           SOH.SubTotal AS TotalSales
    FROM sales.SalesOrderHeader SOH INNER JOIN sales.SalesOrderDetail SOD 
		ON SOH.SalesOrderId = SOD.SalesOrderId
),
cte_pvtMonthSales
AS
(
	SELECT SalesYear, 
		   ISNULL([1], 0) AS Jan, 
		   ISNULL([2], 0) AS Feb, 
		   ISNULL([3], 0) AS Mar, 
		   ISNULL([4], 0) AS Apr, 
		   ISNULL([5], 0) AS May, 
		   ISNULL([6], 0) AS Jun, 
		   ISNULL([7], 0) AS Jul, 
		   ISNULL([8], 0) AS Aug, 
		   ISNULL([9], 0) AS Sep, 
		   ISNULL([10], 0) AS Oct, 
		   ISNULL([11], 0) AS Nov, 
		   ISNULL([12], 0) AS Dec, 
		   (ISNULL([1], 0) + ISNULL([2], 0) + ISNULL([3], 0) + ISNULL([4], 0) + ISNULL([4], 0) + 
			ISNULL([5], 0) + ISNULL([6], 0) + ISNULL([7], 0) + ISNULL([8], 0) + ISNULL([9], 0) + 
			ISNULL([10], 0) + ISNULL([11], 0) + ISNULL([12], 0)) SalesYTD
	FROM cte_monthSales
	PIVOT 
	(
		SUM(TotalSales)
		FOR Months 
		IN([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])
	)
	AS pvt
)
SELECT SalesYear,
		Months AS [Month],
		TotalSales
FROM cte_pvtMonthSales
UNPIVOT
(
	TotalSales
	FOR Months
	IN ([Jan], [Feb], [Mar], [Apr], [May], [Jun],
		[Jul], [Aug], [Sep], [Oct], [Nov], [Dec])
) AS UPVT
ORDER BY SalesYear, Months
GO