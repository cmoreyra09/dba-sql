




/*
Consultar los principales productos por unidades vendidas
*/
--	Definir CTE
WITH TopSoldProducts AS
(
    SELECT P.ProductID, P.Name AS ProductName, SUM(OD.OrderQty) AS TotalQuantitySold
    FROM Production.Product P INNER JOIN Sales.SalesOrderDetail OD
	ON P.ProductID = OD.ProductID
    GROUP BY P.ProductID, P.Name
)
--	Consultar CTE
SELECT ProductID, ProductName, TotalQuantitySold
FROM TopSoldProducts
ORDER BY TotalQuantitySold DESC
GO




/*
Consultar el n�mero total de pedidos 
por ventas por a�o para cada representante de ventas
*/
--	Definir CTE
WITH Sales_CTE (SalesPersonID, SalesOrderID, SalesYear)
AS
(
    SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear
    FROM Sales.SalesOrderHeader
    WHERE SalesPersonID IS NOT NULL
)
--	Consultar CTE
SELECT SalesPersonID, COUNT(SalesOrderID) AS TotalSales, SalesYear
FROM Sales_CTE
GROUP BY SalesYear, SalesPersonID
ORDER BY SalesPersonID, SalesYear
GO