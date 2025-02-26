/*

    CROSS JOIN :


        La clausula cross join, es una operacion que  combina cada fila de una tabla con cada fila de otra tabla generando un producto cartesiano

        El resultado de un cross join incluye todas las combinaciones posibles de filas entre las dos tablas involucradas

*/

-- Crear tabla de colores
CREATE TABLE Colores (
    ID INT PRIMARY KEY,
    Color NVARCHAR(50)
);

INSERT INTO Colores (ID, Color) VALUES (1, 'Rojo'), (2, 'Azul'), (3, 'Verde');

-- Crear tabla de tallas
CREATE TABLE Tallas (
    ID INT PRIMARY KEY,
    Talla NVARCHAR(10)
);

INSERT INTO Tallas (ID, Talla) VALUES (1, 'S'), (2, 'M'), (3, 'L');





SELECT c.Color, t.Talla
FROM Colores c
CROSS JOIN Tallas t;


/* En resumen para cada color correspondiente tiene su talla correspondiente */




-- Utilizar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO

-- Consultar Tablas
SELECT DISTINCT PersonType FROM Person.Person;
SELECT DISTINCT CountryRegionCode FROM Person.StateProvince;
GO


-- ==========================
-- JOIN con dos tablas
-- ==========================
-- ANSI SQL-92
-- CROSS JOIN(JOIN CRUZADO)
--	CROSS JOIN
SELECT DISTINCT P.PersonType, S.CountryRegionCode
FROM Person.Person AS P CROSS JOIN Person.StateProvince AS S
GO