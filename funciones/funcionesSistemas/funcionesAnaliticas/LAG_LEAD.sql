
/*

    LAG :

        Se utiliza para acceder a los datos de las filas anteriores segun el valor de desplazamiento
        definido es una funcion util para compara el valor de la fila actual con el valor de la fila anterior


    LEAD :

        Se utiliza para acceder a los datos de las filas posteriores segun el valor de desplazamiento definido.
        Es una funcion util para compara el valor de la fila actual con el valor de la fila siguiente.



    LAG / LEAD Sintaxis :

        LAG (scalar_expression [ , offset ] [ , default ] ) [ IGNORE NULLS | RESPECT NULLS ]
        OVER ( [ partition_by_clause ] order_by_clause )  



*/




USE AdventureWorks2022
GO


/*
Trabajar con la Tabla SalesPersonQuotaHistory y realizar lo siguiente:
Consultar los campos BusinessEntityID, A�o del campo QuotaDate,Mes del campo QuotaDate y SalesQuota
Mediante la Funci�n LAG mostrar el valor de la fila anterior de SalesQuota 
	particionado por el A�o del campo BusinessEntityID
Mediante la Funci�n LEAD mostrar el valor de la fila posterior de SalesQuota
	particionado por el A�o del campo BusinessEntityID
Ordenar por los campo BusinessEntityID, A�o del campo QuotaDate yMes del campo QuotaDate
*/
SELECT BusinessEntityID, YEAR(QuotaDate) AS SalesYear, 
	   MONTH(QuotaDate) AS Month,SalesQuota AS CurrentQuota,   
       LAG(SalesQuota, 2, 0) OVER (PARTITION BY BusinessEntityID ORDER BY YEAR(QuotaDate)) AS PreviousQuota,
	   LEAD(SalesQuota, 2, 0) OVER (PARTITION BY BusinessEntityID ORDER BY YEAR(QuotaDate)) AS NextQuota
FROM Sales.SalesPersonQuotaHistory  
ORDER BY BusinessEntityID, YEAR(QuotaDate), MONTH(QuotaDate)
GO


-- Consultar la Tabla Sales.SalesPersonQuotaHistory
SELECT * FROM Sales.SalesPersonQuotaHistory
GO


-- Funciones LAG y LEAD
/*
Trabajar con la Tabla SalesPersonQuotaHistory y realizar lo siguiente:
Consultar los campos BusinessEntityID, A o del campo QuotaDate,Mes del campo QuotaDate y SalesQuota
Mediante la Funci n LAG mostrar el valor de la fila anterior de SalesQuota
Mediante la Funci n LEAD mostrar el valor de la fila posterior de SalesQuota
Ordenar por los campo BusinessEntityID, A o del campo QuotaDate yMes del campo QuotaDate
*/

/* Query para obtener la cuota del vendedor por año y mes pasado */
SELECT 
    BusinessEntityID,
    YEAR(QuotaDate) AS Year,
    MONTH(QuotaDate) AS Month,
    SalesQuota,
    LAG(SalesQuota, 1, 0) OVER( PARTITION BY BusinessEntityID ORDER BY YEAR(QuotaDate), MONTH(QuotaDate)) AS PreviousQuotaVendedor
	FROM Sales.SalesPersonQuotaHistory
ORDER BY BusinessEntityID, Year, Month;



-- Funciones de avanzandas para analisis de datos 
BEGIN TRANSACTION 
DECLARE @AnalysisData AS TABLE (
	
	Año INT NOT NULL,
	Mes	INT NOT NULL,
	qty INT NOT NULL
	);

INSERT INTO @AnalysisData
SELECT 
		YEAR(QuotaDate) AS Year,
		MONTH(QuotaDate) AS Month,
		SUM(SalesQuota) AS YTD_CUOTA
			FROM Sales.SalesPersonQuotaHistory
			GROUP BY 
				YEAR(QuotaDate),
				MONTH(QuotaDate)
				ORDER BY YEAR, MONTH

;WITH CTE_Analysis AS (
    SELECT 
        A.Año,
        A.Mes,
        A.qty,
        
        -- Cuota del mes anterior
        LAG(A.qty,1,0) OVER(ORDER BY A.Año, A.Mes) AS beforeQty,

        -- Cuota del mismo mes del año pasado
        LAG(A.qty,1,0) OVER(PARTITION BY A.Mes ORDER BY A.Año) AS beforeYearQty,

        -- Cuota acumulada (Running Total)
        SUM(A.qty) OVER(ORDER BY A.Año, A.Mes ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulativeQty,

        -- Variación porcentual mes a mes
        CASE 
            WHEN LAG(A.qty,1,0) OVER(ORDER BY A.Año, A.Mes) = 0 THEN NULL 
            ELSE (A.qty - LAG(A.qty,1,0) OVER(ORDER BY A.Año, A.Mes)) * 100.0 / LAG(A.qty,1,0) OVER(ORDER BY A.Año, A.Mes) 
        END AS varMonth,

        -- Variación porcentual año contra año
        CASE 
            WHEN LAG(A.qty,1,0) OVER(PARTITION BY A.Mes ORDER BY A.Año) = 0 THEN NULL
            ELSE (A.qty - LAG(A.qty,1,0) OVER(PARTITION BY A.Mes ORDER BY A.Año)) * 100.0 / LAG(A.qty,1,0) OVER(PARTITION BY A.Mes ORDER BY A.Año) 
        END AS varYear,

        -- Brecha mes a mes
        A.qty - LAG(A.qty,1,0) OVER(ORDER BY A.Año, A.Mes) AS gapMonth,

        -- Brecha año contra año
        A.qty - LAG(A.qty,1,0) OVER(PARTITION BY A.Mes ORDER BY A.Año) AS gapYear,

        -- Ranking de los meses con más ventas
        RANK() OVER(ORDER BY A.qty DESC) AS rankQty

    FROM @AnalysisData AS A
)

SELECT * FROM CTE_Analysis
ORDER BY Año, Mes;


COMMIT TRANSACTION
GO 


