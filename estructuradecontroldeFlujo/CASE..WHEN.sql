

/*

    CASE WHEN en SQL Server es una estructura condicional que permite evaluar una serie de condiciones y devolver diferentes valores 
    según se cumpla cada condición. Es similar a un IF-ELSE en programación.

*/


/*
Crer dos dos variables "venta" y "bono"
Si las ventas son mayores a 20 000 el bono es 500
Si las ventas son mayores a 50 000 el bono es 900
De lo contrario el bono es 100
*/


DECLARE @venta INT = 10000
DECLARE @bono SMALLINT = 0

BEGIN
	SET @bono = (CASE
					WHEN @venta > 50000 THEN 900
					WHEN @venta > 20000 THEN 500
					ELSE 100
				 END)
	PRINT('Venta:')
	PRINT(@venta)
	PRINT('Bono:')
	PRINT(@bono)
END
GO



-- Utilizar la Base de Datos NORTHWND
USE NORTHWND
GO


-- Consultar la Tabla Productos(Products)
SELECT * FROM Products
GO


/*
Consultar las columnas "ProductID, ProductName, CategoryID y UnitPrice" 
de la Tabla Productos(Products) y crear otra columna para definir lo siguiente:
Si el valor de CategoryID es 1 el nuevo valor ser� "Bebidas"
Si el valor de CategoryID es 2 el nuevo valor ser� "Condimentos"
Si el valor de CategoryID es 3 el nuevo valor ser� "Dulces"
Si el valor de CategoryID es 4 el nuevo valor ser� "Productos l�cteos"
De lo contrario el valor ser� "Otros"
*/
SELECT ProductID, ProductName, CategoryID,
	CASE
		WHEN CategoryID = 1 THEN 'Bebidas'
		WHEN CategoryID = 2 THEN 'Condimentos'
		WHEN CategoryID = 3 THEN 'Dulces'
		WHEN CategoryID = 4 THEN 'Productos l�cteos'
		ELSE 'Otros'
	END AS Categoria,
	UnitPrice
FROM Products
GO



-- Ejercicio Propuesto
-- Consultar la Tabla Clientes(Customers)
SELECT * FROM Customers
GO


/*
Consultar las columnas "CustomerID, CompanyName, ContactName y Country" 
de la Tabla Clientes(Customers) y crear otra columna para definir lo siguiente:
Si el valor de Country es 'Germany' el nuevo valor ser� "Alemania"
Si el valor de Country es 'UK' el nuevo valor ser� "Reino Unido"
Si el valor de Country es 'France' el nuevo valor ser� "Francia"
Si el valor de Country es 'Spain' el nuevo valor ser� "Espa�a"
De lo contrario dejar el valor del campo "country"
Order de manera Ascendente por la columna Pais
*/
SELECT CustomerID, CompanyName, ContactName, Country,
	CASE
		WHEN Country = 'Germany' THEN 'Alemania'
		WHEN Country = 'UK' THEN 'Reino Unido'
		WHEN Country = 'France' THEN 'Francia'
		WHEN Country = 'Spain' THEN 'Espa�a'
		ELSE 'Otros'
	END AS Pais
FROM Customers
ORDER BY Pais
GO