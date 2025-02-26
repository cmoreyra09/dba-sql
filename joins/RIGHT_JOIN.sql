/*

    La clausula RIGHT JOIN, Tambien conocido como right outer join se utiliza para combinar fila de dos tablas
    de manera que devuelve todas las filas de la tabla de la derecha, la segunda tabla mencionada 
    y las filas concidentes de la tabla de la izquierda la primera tabla mencionadao. Si no hay ninguna coincidencia en la tabla
    izquierda se devuelven NULL para las columnas de la tabla izquierda.



*/



-- Utilizar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO

-- Consultar Tablas
SELECT * FROM Person.Person;
SELECT * FROM Sales.Customer;
GO


-- ==========================
-- JOIN con dos tablas
-- ==========================
-- ANSI SQL-92
-- RIGHT JOIN(JOIN EXTERNO)
--	RIGHT JOIN
SELECT C.CustomerID, C.PersonID, C.StoreID, C.AccountNumber,
		P.BusinessEntityID, P.FirstName, P.MiddleName, P.LastName
FROM Sales.Customer AS C RIGHT JOIN Person.Person AS P
ON C.PersonID = P.BusinessEntityID
ORDER BY P.BusinessEntityID
GO

--	RIGHT OUTER JOIN
SELECT C.CustomerID, C.PersonID, C.StoreID, C.AccountNumber,
		P.BusinessEntityID, P.FirstName, P.MiddleName, P.LastName
FROM Sales.Customer AS C RIGHT OUTER JOIN Person.Person AS P
ON C.PersonID = P.BusinessEntityID
ORDER BY P.BusinessEntityID
GO

--	RIGHT OUTER JOIN sin coincidencia con la Tabla Izquierda
SELECT C.CustomerID, C.PersonID, C.StoreID, C.AccountNumber,
		P.BusinessEntityID, P.FirstName, P.MiddleName, P.LastName
FROM Sales.Customer AS C RIGHT OUTER JOIN Person.Person AS P
ON C.PersonID = P.BusinessEntityID
WHERE C.PersonID IS NULL
ORDER BY P.BusinessEntityID
GO

--	RIGHT OUTER JOIN el orden de la Tabla es IMPORTANTE
SELECT P.BusinessEntityID, P.FirstName, P.MiddleName, P.LastName,
		C.CustomerID, C.PersonID, C.StoreID, C.AccountNumber
-- FROM Sales.Customer AS C RIGHT OUTER JOIN Person.Person AS P
FROM Person.Person AS P RIGHT OUTER JOIN Sales.Customer AS C
ON C.PersonID = P.BusinessEntityID
WHERE C.PersonID IS NULL
ORDER BY P.BusinessEntityID
GO


-- ==========================
-- JOIN con mas tablas
-- ==========================
SELECT P.BusinessEntityID, P.FirstName, P.MiddleName, P.LastName,
		C.CustomerID, C.PersonID, C.StoreID, C.AccountNumber,
		S.BusinessEntityID, S.Name
FROM Person.Person AS P INNER JOIN Sales.Customer AS C
ON P.BusinessEntityID = C.PersonID
						RIGHT JOIN Sales.Store AS S
ON C.StoreID = S.BusinessEntityID
ORDER BY S.BusinessEntityID
GO