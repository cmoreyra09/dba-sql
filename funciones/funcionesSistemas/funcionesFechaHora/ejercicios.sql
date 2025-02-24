-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


-- Establecer el formato de d�a, mes y a�o para las Fechas
SET DATEFORMAT dmy
GO


-- Establecer el idioma Espa�ol(Spanish) para la sesi�n actual
SET LANGUAGE Spanish;
SELECT @@LANGUAGE AS Idioma;
GO


-- Consultar la Tabla Production.Product
SELECT * FROM Production.Product
GO


-- Ejercicio 1
/*
Trabajar con la Tabla "Production.Product" y realizar un script 
con las siguientes especificaciones:
Mostrar las columnas ProductID, Name, ProductNumber y SellStartDate
Obtener a�o, mes y d�a de la Fecha de inicio de venta(SellStartDate)
*/
SELECT ProductID, Name, ProductNumber, SellStartDate,
		YEAR(SellStartDate) Year, MONTH(SellStartDate) Month, DAY(SellStartDate) Day
FROM Production.Product
GO


-- Consultar la Tabla Sales.SalesOrderHeader
SELECT * FROM Sales.SalesOrderHeader
GO


-- Ejercicio 2
/*
Trabajar con la Tabla "Sales.SalesOrderHeader" y realizar un script 
con las siguientes especificaciones:
Mostrar las columnas SalesOrderID y OrderDate
Crear una nueva columna llamada 'SpanishOrderDate' 
que va a tener el siguiente formato:
[Nombre D�a de la semana] [dia] de [nombre del Mes] del [A�o]
*/
SELECT SalesOrderID, OrderDate,
		DATENAME(weekday, OrderDate) + ' ' +
		CAST(DAY(OrderDate) AS CHAR(2)) + ' de ' +
		DATENAME(month, OrderDate) + ' del ' +
		CAST(YEAR(OrderDate) AS CHAR(4)) AS SpanishOrderDate
FROM Sales.SalesOrderHeader
GO


-- Consultar la Tabla Sales.SalesOrderHeader
SELECT * FROM Sales.SpecialOffer
GO


-- Ejercicio 3
/*
Trabajar con la Tabla "Sales.SalesOrderHeader" y realizar un script 
con las siguientes especificaciones:
Mostrar las columnas SpecialOfferID, Description, Type, StartDate y EndDate
Crear nuevas columnas que van calcular 
el tiempo de la oferta en A�os, Meses, Semanas y D�as
del valor de las columnas 'StartDate' y 'EndDate'
*/
SELECT SpecialOfferID, Description, Type, StartDate, EndDate,
		DATEDIFF(year, StartDate, EndDate) AS Year,
		DATEDIFF(month, StartDate, EndDate) AS Month,
		DATEDIFF(week, StartDate, EndDate) AS Week,
		DATEDIFF(day, StartDate, EndDate) AS Day
FROM Sales.SpecialOffer
GO


-- Consultar la Tabla HumanResources.Employee
SELECT * FROM HumanResources.Employee
GO


-- Ejercicio 3
/*
Trabajar con la Tabla "HumanResources.Employee" y realizar un script 
con las siguientes especificaciones:
Mostrar las columnas BusinessEntityID y HireDate
Crear una nueva columna 'CurrentDate' que va a mostrar la Fecha Actual del Sistema
Crear una nueva columna 'WorkYears' que van calcular en A�os
los A�os de Trabajo hasta la Actualidad
*/
SELECT BusinessEntityID, HireDate, CAST( GETDATE() AS DATE ) CurrentDate,
		DATEDIFF( year, HireDate, GETDATE() ) AS WorkYears,
		( ( (365 * YEAR( getdate() ) ) - ( 365 * ( YEAR( HireDate ) ) ) ) + 
		  ( MONTH( getdate() ) - MONTH( HireDate ) ) * 30 +
		  ( DAY( getdate() ) -  DAY( HireDate ) ) )/365 AS WorkYears2
FROM HumanResources.Employee
GO