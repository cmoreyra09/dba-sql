/*


    La clausula OVER determina las particiones y el orden de un conjunto de filas antes de que se aplique la funcion de ventana asociada.
    es decir, la clausula OVER define una ventana o un conjunto de filas definido por el usuario en un conjunto de resultados de la consulta.
    Una funcion de ventana calcula entonces un valor para cada fila de la ventana.

    Se puede utiliza la clausula OVER con funciones para calcular valores agregados tales como medias moviles, agregados acumulados, totales acumulados,ETC.


    Sintaxis :


        OVER(
            [PARTITION BY value_expresion]
            [ORDER BY order_by_expresion [ASC/DESC]]

        
        )


    Si no se especifica PARTITION BY., la funcion trata todas las filas del conjunto de resultados
    de la consulta como unica particion. La funcion se aplicara en todas las filas de la particion
    si no especifica la clausua ORDER BY


    value_expresion solo se puede hacer referencia a las columnas disponibles mediante la clausula
    FROM. value_expresion no se puede hacer referencia a expresiones o alias en lista de seleccion
    value_expression puede ser una expresion de columna, una subconsula escalar, una funcion o una variaable
    definida por el usuario.


    La clausula order by dentro de la funcion OVER () se utiliza para definir el orden en el que la funcion de ventana procesa las filas
    dentro de cada particion. Le permite controlar como se ordenan los datos antes de que se realicen los calculos de la funcion ventana.



    ORDER BY Especifica una columna o expresion segun la cual ordenar.

    Order_by_expresion solo puede hacer referencia a las columnas disponibles mediante la clausula FROM. No se puede especificar un numero entero para representar
    un nombre o alias de columna-- Subconsultas Devolviendo un valor Unico (Subconsulta Escalar - SELECT )


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

    Si no se especifica, el orden predeterminado es ASC y la funcion de ventana utilizada toda las filas de la particion.


	WINDOW FUNCTIONS

*/




BEGIN TRANSACTION 
	
	BEGIN TRY
	
		
		SELECT 
			
			D.DepartmentID,
			D.Name,
			D.GroupName,	
			MIN(D.DepartmentID) OVER() AS minimo, -- Inputa el valor minimo a nivel general por columna es decir solo muestra el valor minimo para todos
			MAX(D.DepartmentID) OVER() AS maximo,  -- Inputa el valor maxinmo a nivel general por columna es decir solo muestra el valor maximo para todos
			AVG(D.DepartmentID) OVER() AS promedio,  -- Inputa el valor maxinmo a nivel general por columna es decir solo muestra el valor maximo para todos
			MIN(D.DepartmentID) OVER(PARTITION BY D.GroupName) AS minimoColumna, -- Inputa valor minimo considerando los grupos de nombre es decir d.groupname
			MAX(D.DepartmentID) OVER(PARTITION BY D.GroupName) AS maximoColumna,-- Inputa el valor maximo considerado los grupos de nombres	
			MIN(D.DepartmentID) OVER(PARTITION BY D.Groupname ORDER BY D.DepartmentID) AS minimoColumnaOrden, -- Inputa el valor minimo consierando el orden grupo
			MAX(D.DepartmentID) OVER(PARTITION BY D.Groupname ORDER BY D.DepartmentID) AS maximoColumanaOrden
				FROM HumanResources.Department AS D
					GROUP BY 
						D.DepartmentID,
						D.Name,
						D.GroupName

	END TRY

	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		PRINT ERROR_LINE()
		PRINT ERROR_SEVERITY() 
		PRINT ERROR_NUMBER()
	END CATCH


COMMIT TRANSACTION
GO