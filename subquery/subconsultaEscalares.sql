/*


    Subconsultas Escalares :


        Las subconsultas escalares en SQL server son subconsultas que devuelven un unico valor (un solo dato)
        como resultado. Este valor puede ser un numero, una cadena, una fecha, etc.


        Las Subconsutlas escalares se utilizan comunmente en las clausulas SELECT , WHERE o en cualquier lugar donde se espera
        un valor simple

        Una subconsulta escalar esta encerrada entre parentesis y se ejecuta una ves para cada fila de la consutla principal
        . Debido a que devuelven un unico valor, pueden utilizarse en expresiones de asignacion, comparaciones o en combinaciones con operadores aritmenticos y logicos.


        - Subconsulta Escalares en un SELECT
        - Subconsulta Escalares en un WHERE
        - Subconsulta Escalares en un expresion de asignacion (Variables)

*/



-- Subconsultas Devolviendo un valor Unico (Subconsulta Escalar - SELECT )


SELECT 
	P.ProductName,
	P.UnitPrice,
	(SELECT AVG(UnitPrice) AS Average FROM Products) AS promedioGlobalversion1,
	AVG(P.UnitPrice) OVER() AS promedioGlobalversion2
	FROM Products AS P



-- Subconsulta Escalar en la clausula Where (Subconsulta en la clausula WHERE )

SELECT 
	P.ProductName,
	P.UnitPrice,
	(SELECT AVG(UnitPrice) AS Average FROM Products) AS promedioGlobalversion1,
	AVG(P.UnitPrice) OVER() AS promedioGlobalversion2
	FROM Products AS P
		WHERE UnitPrice > (SELECT AVG(UnitPrice) AS Average FROM Products)


-- Subconsulta Escalar en Expresiones de asignacion (Subconsulta Variables)

DECLARE @precioPromedio DECIMAL(10,2)
SET @precioPromedio = ( SELECT AVG(UnitPrice) FROM Products )
SELECT @precioPromedio AS avgUnitPrice
GO