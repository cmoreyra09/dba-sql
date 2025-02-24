
/* Tipos de Datos - Numericos Exactos (Enteros) */


-- Usar la Base de Datos tempdb
USE tempdb
GO


-- Crear la Tabla Numeros
CREATE TABLE Numeros(
	col_tinyint		TINYINT,
	col_smallint	SMALLINT,
	col_int			INT,
	col_bigint		BIGINT
)
GO



-- Insertar registro Decimal en la Tabla Numeros
INSERT INTO Numeros VALUES(47.69, 47.69, 47.69, 47.69)
GO


-- Consultat la Tabla Numeros
SELECT * FROM Numeros --Unicamente toma la parte entera
GO

/* Este resultados solo devuelve numerocs exactos enteros es decire si es 47.69 su resutlado sera 47 */

-- Insertar un valor negativo en TINYINT
 


-- Insertar un valor correcto en TINYINT
INSERT INTO Numeros (col_tinyint) VALUES(100)
GO


-- Consultat la Tabla Numeros
SELECT * FROM Numeros
GO


-- Insertvar un valor fuera de rango en TINYINT
INSERT INTO Numeros (col_tinyint) VALUES(300)
GO


-- Consultat la Tabla Numeros
SELECT * FROM Numeros
GO


-- Insertar el M�ximo valor positivo permitido en SMALLINT
INSERT INTO Numeros (col_smallint) VALUES(32767)
GO


-- Consultat la Tabla Numeros
SELECT * FROM Numeros
GO


-- Aumentar en 1 el M�ximo valor positivo permitido en SMALLINT
INSERT INTO Numeros (col_smallint) VALUES(32768)
GO


-- Consultat la Tabla Numeros
SELECT * FROM Numeros
GO


-- Consultar el N�mero de Bytes usados
SELECT DATALENGTH(col_tinyint) AS col_tinyint, 
	   DATALENGTH(col_smallint) AS col_smallint,
	   DATALENGTH(col_int) AS col_int,
	   DATALENGTH(col_bigint) AS col_bigint
FROM Numeros

/* Esta funcion devuelve el numeros de Bytes de storage de una columna */
GO