-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


-- Consultar la Tabla HumanResources.Employee
SELECT * FROM HumanResources.Employee
GO


/*
Utilizar la Tabla de Empleados(Employee) y resolver lo siguiente:
Contar la cantidad de Empleados(Employee) que se han contratado
a partir de los A�os de la Fecha de Contrataci�n(HireDate)
Ordenar de manera Ascendente por el A�o de la Fecha de Contrataci�n(HireDate)
*/
SELECT YEAR(HireDate) AS Year, COUNT(1) AS Count
FROM HumanResources.Employee
GROUP BY YEAR(HireDate)
ORDER BY YEAR(HireDate)
GO



-- Consultar la Tabla Production.TransactionHistory
SELECT * FROM Production.TransactionHistory
GO


/*
Utilizar la Tabla de Historial de Transacciones(TransactionHistory) y resolver lo siguiente:
Contar la cantidad de Transacciones que se han realizado
a partir de la Fecha de Transacci�n(TransactionDate) en los A�os y Meses
los Meses deben de mostrarse en Espa�ol
y deben de estar Ordenado por el A�o y Mes
*/
-- Forma Erronea
SELECT YEAR(TransactionDate) AS Year, 
		DATENAME(month, TransactionDate) Month,
		COUNT(1) AS Count
FROM Production.TransactionHistory
GROUP BY YEAR(TransactionDate), DATENAME(month, TransactionDate)
ORDER BY YEAR(TransactionDate), DATENAME(month, TransactionDate)
GO


-- Forma Incorrecta
SELECT YEAR(TransactionDate) AS Year, 
		MONTH(TransactionDate) Month,
		COUNT(1) AS Count
FROM Production.TransactionHistory
GROUP BY YEAR(TransactionDate), MONTH(TransactionDate)
ORDER BY YEAR(TransactionDate), MONTH(TransactionDate)
GO


-- Correcto
SELECT YEAR(TransactionDate) AS Year, 
		CASE
			WHEN MONTH(TransactionDate) = 1 THEN 'Enero'
			WHEN MONTH(TransactionDate) = 2 THEN 'Febrero'
			WHEN MONTH(TransactionDate) = 3 THEN 'Marzo'
			WHEN MONTH(TransactionDate) = 4 THEN 'Abril'
			WHEN MONTH(TransactionDate) = 5 THEN 'Mayo'
			WHEN MONTH(TransactionDate) = 6 THEN 'Junio'
			WHEN MONTH(TransactionDate) = 7 THEN 'Julio'
			WHEN MONTH(TransactionDate) = 8 THEN 'Agosto'
			WHEN MONTH(TransactionDate) = 9 THEN 'Setiembre'
			WHEN MONTH(TransactionDate) = 10 THEN 'Octubre'
			WHEN MONTH(TransactionDate) = 11 THEN 'Noviembre'
			WHEN MONTH(TransactionDate) = 12 THEN 'Diciembre'
		END AS Month,
		COUNT(1) AS Count
FROM Production.TransactionHistory
GROUP BY YEAR(TransactionDate), MONTH(TransactionDate)
ORDER BY YEAR(TransactionDate), MONTH(TransactionDate)
GO