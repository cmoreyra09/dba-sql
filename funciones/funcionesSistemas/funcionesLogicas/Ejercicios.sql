-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


-- Consultar la Tabla Sales.Customer
SELECT * FROM Sales.Customer
GO

-- Ejercicio 1
/*
Mostrar el idCliente(CustomerID), idTerritorio(TerritoryID) de la Tabla Cliente(Customer) y
tambien crear una nueva columna llamada 'Continente' en base a las siguientes condiciones:
Si el valor del campo TerritoryID es 1 debe reemplazar el valor a "America"
Si el valor del campo TerritoryID es 2 debe reemplazar el valor a "Europa"
Si el valor del campo TerritoryID es 3 debe reemplazar el valor a "�frica"
Si el valor del campo TerritoryID es 4 debe reemplazar el valor a "Asia"
Si el valor del campo TerritoryID es 5 debe reemplazar el valor a "Ocean�a"
Si el valor del campo TerritoryID es 6 debe reemplazar el valor a "America"
Si el valor del campo TerritoryID es 7 debe reemplazar el valor a "Europa"
Si el valor del campo TerritoryID es 8 debe reemplazar el valor a "�frica"
Si el valor del campo TerritoryID es 9 debe reemplazar el valor a "Asia"
Si el valor del campo TerritoryID es 10 debe reemplazar el valor a "Ocean�a"
*/
SELECT CustomerID, TerritoryID,
	CHOOSE(TerritoryID, 'America', 'Europa', '�frica', 'Asia', 'Ocean�a', 
						'America', 'Europa', '�frica', 'Asia', 'Ocean�a') AS Continente
FROM Sales.Customer
GO



-- Consultar la Production.Product
SELECT * FROM Production.Product
GO

-- Ejercicio 2
/*
De la Tabla Producto(Product) consultar las columnas nombre(Name),
clase(Class), color(Color), numero del producto(ProductNumber) y
tambien crear una nueva columna llamada 'primerNoNull' en base a las siguientes condiciones:
Como primera prioridad mostrar el valor de la columna 'Class' siempre que no sea NULL
Como segunda prioridad mostrar el valor de la columna 'Color' siempre que no sea NULL
Como tercera prioridad mostrar el valor de la columna 'ProductNumber' siempre que no sea NULL
*/
SELECT Name, Class, Color, ProductNumber,  
COALESCE(Class, Color, ProductNumber) AS primerNoNull  
FROM Production.Product
GO



-- Consultar la Production.Product
SELECT * FROM Production.Product
GO

-- Ejercicio 3
/*
De la Tabla Producto(Product) consultar las columnas idProducto(ProductID),
marca bandera(MakeFlag), marca bandera terminado(FinishedGoodsFlag)
Donde el valor de la columna 'ProductID' sea menor a 320 y
tambien crear una nueva columna llamada 'verificado' en base a las siguientes condiciones:
Si los valores de las columnas 'MakeFlag' y 'FinishedGoodsFlag' son iguales, asignar el valor de NULL
Si los valores de las columnas 'MakeFlag' y 'FinishedGoodsFlag' son diferentes, asignar el valor de la columna 'MakeFlag'
Ordenar de manera Ascendente por la columna "ProductID"
*/
SELECT ProductID, MakeFlag, FinishedGoodsFlag,   
   NULLIF(MakeFlag,FinishedGoodsFlag) AS verificado
FROM Production.Product  
WHERE ProductID < 320
ORDER BY ProductID
GO