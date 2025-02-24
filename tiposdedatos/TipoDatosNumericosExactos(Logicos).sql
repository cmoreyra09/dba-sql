-- Usar la Base de Datos tempdb
USE tempdb
GO


-- Crear la Tabla Binario
CREATE TABLE Binario(
	col_binario1	BIT,
	col_binario2	BIT
)
GO


-- Insertar registro en la Tabla Binario
INSERT INTO Binario VALUES(1, 0)
GO


-- Consultar la Tabla Binario
SELECT * FROM Binario
GO


-- Insertar valores como TRUE y FALSE
INSERT INTO Binario VALUES('TRUE', 'FALSE')
GO
INSERT INTO Binario VALUES('true', 'false')
GO

/* 1 es igual a true,
  0 es igual a False*/



-- Consultar la Tabla Binario
SELECT * FROM Binario
GO


-- Insertar valores de tipo caracter
INSERT INTO Binario VALUES('t', 'f')
GO
INSERT INTO Binario VALUES('Hola', 'mundo')
GO

/* Este error no es posible hacer la conversion de varchar a tipo bit solo es reconocible para tipos de datos bool*/


-- Consultar la Tabla Binario
SELECT * FROM Binario
GO


-- Insertar valores Enteros negativos y positivos
INSERT INTO Binario VALUES(-123, 123)
GO

/* Cualquier tipo de datos negativo positivo se genera un tipo de datos 1 */

-- Consultar la Tabla Binario
SELECT * FROM Binario
GO


-- Insertar valores Decimales negativos y positivos
INSERT INTO Binario VALUES(-1.1415, 456.78910)
GO

/* De igual manera los tipos de datos se almacenan como 1 ya sea positivo , negativo y decimal */

-- Consultar la Tabla Binario
SELECT * FROM Binario
GO


-- Consultar el N�mero de Bytes usados
SELECT DATALENGTH(col_binario1) AS binario1, 
	   DATALENGTH(col_binario2) AS binario2
FROM Binario
GO

