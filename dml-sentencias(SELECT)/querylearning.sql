/* 

Clausulas :

		- DISTINCT	= Se utilizar para retornar los valores unicos de una columna.

		- WHERE		= Se utiliza para filtrar las filas devueltas por una consulta.
		
		- ORDER BY	= Se utiliza para ordenar el conjuto de resultados en orden ascendente y descendente.
				- ASC  = ORDENA DEL VALOR MAS BAJO AL VALOR MAS ALTO
				- DESC = ORDENA DEL VALOR MAS ALTO AL VALOR MAS BAJO
		
		- TOP		= Permite limitar el numero de filas devueltas en un conjunto de resultados de consulta.

		- PERCENT	= es opcional y devuelve las filas superiores basadas en un porcentaje del conjunto de resultados total.

		- WITH TIES = Esta clausula permite incluir las filas en el conjunto de resultados que coinciden con la ultima fila.



*/

DECLARE @Clientes TABLE (
    
	
	Id				INT PRIMARY KEY IDENTITY(1,1), -- Auto incremento
    NombreCliente	NVARCHAR(100),
    Telefono		NVARCHAR(20),
	monto			INT
);

INSERT INTO @Clientes (NombreCliente, Telefono, monto) 
VALUES 
    ('Juan Pérez', '123456789',123023),
    ('Ana Gómez', '987654321',123123),
    ('Carlos López', '555666777',1),
    ('María Torres', '444555666',2),
    ('Luis Fernández', '111222333',3);

-- Obtener los valores unicos de una sola columna 

SELECT DISTINCT (NombreCliente) FROM @Clientes;									-- Clausula Distinct.
SELECT DISTINCT (NombreCliente) FROM @Clientes WHERE Telefono = '987654321';	-- Clausula Where.
SELECT * FROM @Clientes ORDER BY 4 DESC;										-- Clausula Order by DESC de Mayor a Menor.
SELECT * FROM @Clientes ORDER BY 4 ASC;											-- Clausula Order by ASC  de Menor a Mayor.
SELECT TOP(2) * FROM @Clientes;													-- Clausula Top Limita los resultados segun el top asignado.
SELECT TOP(2) PERCENT * FROM @Clientes ;		 							    -- Clausula Top Limita los resultados segun el top asignado.