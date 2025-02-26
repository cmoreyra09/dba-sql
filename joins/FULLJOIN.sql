/*

    FULL JOIN :

    La clausula FULL JOIN, tambien conocido como full outer join se utiliza para combinar filas de dos tablas de manera
    que devuelve todas las filas cuando hay una coincidencia en una de las tablas. El resultado incluira todas las filas
    de ambas tablas y cuando no haya coincidencia, las columnas de la tabla faltante tendran valores NULL.



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
-- FULL JOIN(JOIN EXTERNO)
--	FULL JOIN

SELECT C.CustomerID, C.PersonID, C.StoreID, C.AccountNumber,
		P.BusinessEntityID, P.FirstName, P.MiddleName, P.LastName
FROM Sales.Customer AS C FULL JOIN Person.Person AS P
ON C.PersonID = P.BusinessEntityID
ORDER BY C.CustomerID
GO

--	FULL OUTER JOIN
SELECT C.CustomerID, C.PersonID, C.StoreID, C.AccountNumber,
		P.BusinessEntityID, P.FirstName, P.MiddleName, P.LastName
FROM Sales.Customer AS C FULL OUTER JOIN Person.Person AS P
ON C.PersonID = P.BusinessEntityID
ORDER BY C.CustomerID
GO

--	FULL OUTER JOIN sin coincidencia con los KEY iguales
SELECT C.CustomerID, C.PersonID, C.StoreID, C.AccountNumber,
		P.BusinessEntityID, P.FirstName, P.MiddleName, P.LastName
FROM Sales.Customer AS C FULL OUTER JOIN Person.Person AS P
ON C.PersonID = P.BusinessEntityID
WHERE C.PersonID IS NULL OR P.BusinessEntityID IS NULL
ORDER BY C.CustomerID
GO



-- ==========================
-- JOIN con mas tablas
-- ==========================
SELECT P.BusinessEntityID, P.FirstName, P.MiddleName, P.LastName,
		C.CustomerID, C.PersonID, C.StoreID, C.AccountNumber,
		S.BusinessEntityID, S.Name
FROM Person.Person AS P INNER JOIN Sales.Customer AS C
ON P.BusinessEntityID = C.PersonID
						FULL OUTER JOIN Sales.Store AS S
ON C.StoreID = S.BusinessEntityID
ORDER BY P.BusinessEntityID
GO