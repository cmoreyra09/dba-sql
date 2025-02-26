/*


    Las subconsultas multivalor en SQL server son subconsultas que pueden devolver multiples filas o columnas como resultado. A diferencia
    de las subconsultas escalares que devuelven un solo valor, las subconsultas multivalor pueden proporcionar una lista de valores o un conjunto
    de resultados completo

    Las subconsultas multivalor se utilizan en diferentes contextos dentro de una consulta principal, como en las clausula WHERE HAVING Y from.

    Se usan con operadores que pueden manejar conjuntos de resultado, como IN, EXISTS, ALL y tambien pueden formar parte de una lista de seleccion en consultas
    anidadas mas complejas


    -- Subconsulta Multivalor con IN
    -- Subconsulta Multivalor con EXISTS
    -- Subconsulta Multivalor en la clausula FROM


*/




USE Northwind
GO


/*  

	Subconsultas Multivalor 

	Que ventajas tiene utiliza subconsultas ?

	No altear el script ya construido
	Permite desarrollar logica para solucionar problemas
	las subconsutlas es fundamental para las vistas

*/


SELECT 
	C.CustomerID,
	C.CompanyName,
	C.ContactName,
	C.Country
		FROM Customers AS C
		GO


SELECT DISTINCT(O.CustomerID) FROM Orders AS O


-- Subconsulta MultiValor con IN (1)
-- Subconsulta Multivalor con EXISTS (2)
-- Subconsulta Correlacionada (3)
-- Subconsulta Multivalor en la clausula FROM (4)



BEGIN TRANSACTION 


	DECLARE @option AS TINYINT SET @option = 1;

	IF @option = 1
		BEGIN

			SELECT 
				C.CustomerID,
				C.CompanyName,
				C.ContactName,
				C.Country
					FROM Customers AS C
						WHERE CustomerID IN (SELECT DISTINCT(O.CustomerID) FROM Orders AS O)
	
		END

	IF @option = 2
		BEGIN

			SELECT 
				C.CustomerID,
				C.CompanyName,
				C.ContactName,
				C.Country
					FROM Customers AS C
						WHERE EXISTS (SELECT DISTINCT(O.CustomerID) FROM Orders AS O WHERE O.CustomerID = 'ANATR')

		END

	IF @option = 3
		BEGIN

			SELECT 
				C.CustomerID,
				C.CompanyName,
				C.ContactName,
				C.Country
					FROM Customers AS C
						WHERE EXISTS (SELECT DISTINCT(O.CustomerID),O.OrderDate FROM Orders AS O WHERE O.CustomerID = C.CustomerID)

		END

	IF @option = 4
		BEGIN



		SELECT T.Year, ROUND(SUM(T.Total),2) AS Total FROM
			(SELECT 
				C.CustomerID,
				C.CompanyName,
				C.Address,
				C.Country,
				C.City,
				O.OrderDate,
				YEAR(O.OrderDate) AS Year,
				MONTH(O.OrderDate) AS Month,
				P.ProductName,
				OD.UnitPrice,
				OD.Quantity,
				OD.Discount,
				OD.Quantity * (OD.UnitPrice - (OD.UnitPrice * OD.Discount)) AS Total,
				CA.CategoryName,
				CA.Description
				FROM Customers AS C
					INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID
					INNER JOIN [Order Details] AS OD ON OD.OrderID = O.OrderID
					INNER JOIN Products AS P ON P.ProductID = OD.ProductID
					INNER JOIN Categories AS CA ON CA.CategoryID  = P.CategoryID
				) AS T
					GROUP BY T.Year
						ORDER BY 1 ASC
		END


COMMIT TRANSACTION
GO


/* Anidacion Multiples */ 
SELECT 
	T.ProductName, 
	T.Quantity, 
	T.UnitPrice, 
	T.Total 
		FROM (SELECT 
				S.CustomerID, 
				S.CompanyName, 
				S.OrderDate, 
				S.ProductName, 
				S.UnitPrice, 
				S.Quantity, 
				S.Quantity * (S.UnitPrice - (S.UnitPrice * S.Discount)) AS Total
		FROM (SELECT 
				C.CustomerID, 
				C.CompanyName, 
				O.OrderDate, 
				P.ProductName, 
				OD.UnitPrice, 
				OD.Quantity, 
				OD.Discount
					FROM Customers AS C
						INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID
						INNER JOIN [Order Details] AS OD ON OD.OrderID = O.OrderID
						INNER JOIN Products AS P ON P.ProductID = OD.ProductID
    ) AS S
) AS T;



