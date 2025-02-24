-- Usar la Base de Datos tempdb
USE tempdb
GO


-- Crear la Tabla Binarias
CREATE TABLE Binarias(
	col_binary		BINARY(20),		-- 8001 Error
	col_varbinary	VARBINARY(20),	-- 8001 Error
	col_image		IMAGE
)
GO


-- Insertar registro en la Tabla Binarias
INSERT INTO Binarias 
VALUES(0x12345,
	   0x12345,
	   0x12345)
GO


-- Consultar la Tabla Binarias
SELECT * FROM Binarias
GO





-- Consultar el N�mero de Bytes usados
SELECT DATALENGTH(col_binary) AS col_binary,
	   DATALENGTH(col_varbinary) AS col_varbinary,
	   DATALENGTH(col_image) AS col_image
FROM Binarias
GO