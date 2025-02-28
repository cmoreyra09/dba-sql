-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


/*
Consultar los productos con su subcategor�a y categor�a asociadas
*/
WITH ProductCategoryCTE		--Definir CTE ProductCategoryCTE
AS
(
    SELECT ProductCategoryID, Name AS CategoryName
    FROM Production.ProductCategory
),
ProductSubcategoryCTE		--Definir CTE ProductSubcategoryCTE
AS
(
    SELECT ProductSubcategoryID, Name AS SubcategoryName, ProductCategoryID
    FROM Production.ProductSubcategory
),
ProductDetailCTE			--Definir CTE ProductDetailCTE
AS
(
    SELECT P.ProductID, P.Name AS ProductName, P.ProductNumber,
        P.Color, P.ListPrice, PS.SubcategoryName, PC.CategoryName
    FROM Production.Product AS P INNER JOIN ProductSubcategoryCTE AS PS
		ON P.ProductSubcategoryID = PS.ProductSubcategoryID
								 INNER JOIN ProductCategoryCTE AS PC
		ON PS.ProductCategoryID = PC.ProductCategoryID
)
--	Consultar CTE
SELECT PD.ProductID, PD.ProductName, PD.ProductNumber, PD.Color,
    PD.ListPrice, PD.SubcategoryName, PD.CategoryName
FROM ProductDetailCTE AS PD
ORDER BY pd.ProductID
GO




/*
Mostrar los importes monetarios en un formato de Moneda
*/
WITH Sales_CTE(SalesPersonID, TotalSales, SalesYear)			--Definir CTE Sales_CTE
AS
(
    SELECT SalesPersonID, SUM(TotalDue) AS TotalSales, YEAR(OrderDate) AS SalesYear
    FROM Sales.SalesOrderHeader
    WHERE SalesPersonID IS NOT NULL
    GROUP BY SalesPersonID, YEAR(OrderDate)

),
Sales_Quota_CTE (BusinessEntityID, SalesQuota, SalesQuotaYear)	--Definir CTE Sales_Quota_CTE
AS
(
       SELECT BusinessEntityID, SUM(SalesQuota)AS SalesQuota, YEAR(QuotaDate) AS SalesQuotaYear
       FROM Sales.SalesPersonQuotaHistory
       GROUP BY BusinessEntityID, YEAR(QuotaDate)
)
--	Consultar CTE
SELECT SalesPersonID, 
	SalesYear
  , FORMAT(TotalSales,'C','en-us') AS TotalSales
  , SalesQuotaYear
  , FORMAT(SalesQuota,'C','en-us') AS SalesQuota
  , FORMAT(TotalSales - SalesQuota, 'C','en-us') AS Amt_Above_or_Below_Quota
FROM Sales_CTE INNER JOIN Sales_Quota_CTE 
	ON Sales_Quota_CTE.BusinessEntityID = Sales_CTE.SalesPersonID
		AND Sales_CTE.SalesYear = Sales_Quota_CTE.SalesQuotaYear
ORDER BY SalesPersonID, SalesYear
GO