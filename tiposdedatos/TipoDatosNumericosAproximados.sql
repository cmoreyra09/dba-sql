-- Usar la Base de Datos tempdb
USE tempdb
GO


-- Crear la Tabla Aproximados
CREATE TABLE Aproximados(
	col_float1		FLOAT(24),	-- 7 d�gitos
	col_float2		FLOAT(53),	-- 15 d�gitos
	col_real		REAL		-- Notaci�n cientifica
)
GO


-- Insertar registro en la Tabla Aproximados
INSERT INTO Aproximados 
VALUES(123.12345678901234567890123456789012345, -- 38 d�gitos en total
	   123.12345678901234567890123456789012345,	-- 38 d�gitos en total
	   12312345678901234567890123456789012345)	-- 38 d�gitos en total
GO


-- Consultar la Tabla Aproximados
SELECT * FROM Aproximados
GO


-- Validar la cantidad de d�gitos
col_float1	-> 123.123 5
col_float2	-> 123.123 456 789 012
col_real	-> 1.231235E+37
		


-- Consultar la Tabla Aproximados
SELECT * FROM Aproximados
WHERE col_float1 = 123.1235
GO


-- Volver a consultar la Tabla Aproximados
SELECT * FROM Aproximados
WHERE col_float1 = 123.12345678901234567890123456789012345
GO



-- Consultar el N�mero de Bytes usados
SELECT DATALENGTH(col_float1) AS col_float1, 
	   DATALENGTH(col_float2) AS col_float2,
	   DATALENGTH(col_real) AS col_real
FROM Aproximados
GO