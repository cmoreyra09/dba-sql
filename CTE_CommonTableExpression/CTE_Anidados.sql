-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


/*
Consultar las ventas totales de cada producto
dentro de sus respectivas categoria del producto
junto con informaci�n sobre las ventas totales 
de cada Categor�a del Producto
*/
WITH ProductSalesByCategory		--Definir CTE ProductSalesByCategory
AS
(
    SELECT PC.Name AS Category, PSC.Name AS Subcategory,
        P.ProductID, P.Name AS ProductName,
        SUM(SOD.LineTotal) AS TotalSales
    FROM Sales.SalesOrderDetail SOD INNER JOIN Production.Product P
		ON SOD.ProductID = P.ProductID
									INNER JOIN Production.ProductSubcategory PSC
		ON P.ProductSubcategoryID = PSC.ProductSubcategoryID
									INNER JOIN Production.ProductCategory PC
		ON PSC.ProductCategoryID = PC.ProductCategoryID
    GROUP BY PC.Name, PSC.Name, P.ProductID, P.Name
),
CategoryTotalSales				--Definir CTE CategoryTotalSales
AS 
(
    SELECT Category, SUM(TotalSales) AS CategoryTotal
    FROM ProductSalesByCategory		--Definir el CTE ProductSalesByCategory
    GROUP BY Category
)
--	Consultar CTE
SELECT C.Category, 
		C.CategoryTotal, 
		P.ProductName, 
		P.TotalSales
FROM ProductSalesByCategory P INNER JOIN CategoryTotalSales C 
	ON P.Category = C.Category
ORDER BY C.Category, P.ProductName
GO