-- Usar la Base de Datos tempdb
USE tempdb
GO


-- Crear la Tabla Decimales
CREATE TABLE Decimales(
	col_decimal1	DECIMAL(7,2),
	col_decimal2	DECIMAL(15,4),
	col_decimal3	DECIMAL(20,8),
	col_decimal4	DECIMAL(38,10),
	col_numeric1	NUMERIC(7,2),
	col_numeric2	NUMERIC(15,4),
	col_numeric3	NUMERIC(20,8),
	col_numeric4	NUMERIC(38,10)
)
GO


-- Insertar registros Enteros y Decimal en la Tabla Decimales
INSERT INTO Decimales 
VALUES(100, 200.20, 300, 400.4444, 500, 600.666666, 700, 800.88888888)
GO


-- Consultar la Tabla Decimales
SELECT * FROM Decimales --Agrega ceros a la parte decimal
GO


--=========== Trabajar con la Columna con 2 decimales ===========--
-- Insertar un valor con 2 decimales
INSERT INTO Decimales(col_decimal1) VALUES(49.98)
GO

-- Consultar la Tabla Decimales
SELECT * FROM Decimales
GO


-- Insertar un valor con 3 decimales
INSERT INTO Decimales(col_decimal1) VALUES(49.987)
GO

-- Consultar la Tabla Decimales
SELECT * FROM Decimales -- Redondea el valor decimal
GO


-- Insertar otro valor con 3 decimales
INSERT INTO Decimales(col_decimal1) VALUES(49.999)
GO

-- Consultar la Tabla Decimales
SELECT * FROM Decimales -- Redondea el valor entero
GO


-- Insertar un valor que supere los 7 d�gitos
INSERT INTO Decimales(col_decimal1) VALUES(99999.999) --100000.00
GO
-- Esto es un error segun la precision que se inpute en la columna como datatype



-- Consultar la Tabla Decimales
SELECT * FROM Decimales
GO


--=========== Agregar una nueva columna ===========--
ALTER TABLE Decimales
ADD col_decimal DECIMAL(4,5); --La escala debe ser menor o igual a la precisi�n
 /* Esto no puede darse porque la prcesion no puede ser menos que la escala decimal a nivel de datatype esta mal */

				
-- Consultar los Bytes usados
SELECT DATALENGTH(col_decimal1) AS decimal1, 
	   DATALENGTH(col_decimal2) AS decimal2,
	   DATALENGTH(col_decimal3) AS decimal3,
	   DATALENGTH(col_decimal4) AS decimal4,
	   DATALENGTH(col_numeric1) AS numeric1,
	   DATALENGTH(col_numeric2) AS numeric2,
	   DATALENGTH(col_numeric3) AS numeric3,
	   DATALENGTH(col_numeric4) AS numeric4
FROM Decimales
GO


-- Insertar valores
INSERT INTO Decimales
VALUES(99999.99, 99999999999.9999, 
		999999999999.99999999, 9999999999999999999999999999.9999999999,
	   99999.99, 99999999999.9999, 
		999999999999.99999999, 9999999999999999999999999999.9999999999)
GO

-- Consultar la Tabla Decimales
SELECT * FROM Decimales
GO



-- Volver a consultar los Bytes usados
SELECT DATALENGTH(col_decimal1) AS decimal1, 
	   DATALENGTH(col_decimal2) AS decimal2,
	   DATALENGTH(col_decimal3) AS decimal3,
	   DATALENGTH(col_decimal4) AS decimal4,
	   DATALENGTH(col_numeric1) AS numeric1,
	   DATALENGTH(col_numeric2) AS numeric2,
	   DATALENGTH(col_numeric3) AS numeric3,
	   DATALENGTH(col_numeric4) AS numeric4
FROM Decimales
GO