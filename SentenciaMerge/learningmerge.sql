


-- Ubicarnos en la Base de Datos master
USE master
GO


-- Validar si existe la Base de Datos Retail
DROP DATABASE IF EXISTS Retail
GO


-- Crear la Base de Datos Retail
CREATE DATABASE Retail
GO


-- Usar la Base de Datos Retail
USE Retail
GO


-- Crear la Tabla Product
CREATE TABLE Products(
	productID		INT,
	productName		VARCHAR(50),
	price			DECIMAL(9,2)
)
GO


-- Insertar registros en la Tabla ProductSource
INSERT INTO Products(productID, productName, price)
			  VALUES(1, 'Mouse', 100),
					(2, 'Keyboard', 10),
					(5, 'Ram', 50),
					(6, 'Micro SD', 70);
GO


-- Crear la Tabla ProductSource(
CREATE TABLE ProductsSource(
	productID		INT,
	productName		VARCHAR(50),
	price			DECIMAL(9,2)
)
GO


-- Insertar registros en la Tabla ProductSource
INSERT INTO ProductsSource(productID, productName, price)
					VALUES(1, 'Mouse', 100),
						  (2, 'Keyboard', 150),
						  (3, 'Monitor', 800),
						  (4, 'SSD', 80);
GO


-- Consultar la Tabla Product y ProductSource
SELECT * FROM Products; -- Destino
SELECT * FROM ProductsSource; -- Origen
GO


/*

	Query Merge de Insercion :

	Si no existe el valor en la tabla de destino correspondiente a una tabla de origen , se va insertar dicho valores cuando no haya una coincidencia.


*/


MERGE Products AS destino -- (1) Se Especifica el destino primero
	USING ProductsSource AS origen  -- (2) Se especifica el origen
		ON -- (3) On para el match
		destino.productId = origen.productId -- (4) llaves de similitud
		-- Evento Insert 
			
			WHEN NOT MATCHED BY TARGET THEN -- Cuando no haga match / Cuando estos valores no sean iguales hara lo siguiente
				INSERT(productID, productName, price)
					VALUES(origen.productId, origen.productName , origen.price)

-- Sentencia de actualizacion

			WHEN MATCHED THEN
				UPDATE 
					SET destino.productName  =  origen.productName,
						destino.price		 =  origen.price

-- Sentencia Merge de Elminacion
			WHEN NOT MATCHED BY SOURCE THEN
				DELETE;

GO



