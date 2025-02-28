-- Usar la Base de Datos NORTHWND
USE NORTHWND
GO



-- Crear una Vista
--	Mostrar la compra del cliente y el empleado que lo atendi�
CREATE OR ALTER VIEW V_CustomerInformation
AS
	SELECT C.CompanyName, C.ContactName, C.Address,
			O.OrderDate, O.RequiredDate, O.ShippedDate,
			P.ProductName, OD.UnitPrice, OD.Quantity, OD.Discount,
			CA.CategoryName,
			E.FirstName + ' ' + E.LastName Name, E.Title
	FROM Customers C
	INNER JOIN Orders O ON C.CustomerID = O.CustomerID
	INNER JOIN [Order Details] OD ON OD.OrderID = O.OrderID
	INNER JOIN Employees E ON O.EmployeeID = E.EmployeeID
	INNER JOIN Products P ON OD.ProductID = P.ProductID
	INNER JOIN Categories CA ON P.CategoryID = CA.CategoryID
	GO
GO


-- Consultar la Vista
SELECT * FROM V_CustomerInformation
GO

SELECT CompanyName, ContactName, Address,
		UnitPrice, Quantity, Discount
FROM V_CustomerInformation
GO