/*

    Funciones de Agregacion :


    Son funciones especializadas que realizan calculos sobre grupos de variables y devuelven un unico resultado.
    A diferencia de las funciones tradicionales, las funciones de agregado trabajan sobre grupos de filas de datos.

    
    MAX : 

        La funcion max devuelve el valor maximo de la expresion.

    
    Min :
        
        La funcion min devuelve el valor minimo de la expresion.

    
    SUM :

        Devuelve la suma de todos los valores de la expresion . Sum solo puede utilizarse en columnas numericas. Se omiten los valores NULL.



    AVG :

        Devuelve el promedio de los valores de un grupo . AVG solo se puede utilizarse con columnas numericas.
        Omite los valores NULL


    COUNT : 

        Devuelve el numero de elementos encontrados, se omiten los valores NULL . COUNT siempre devuelve un valor tipo de datos int


    COUNT_BIG:
        Devuelve el numero de elementos encontrados, se moiten los valores NULL. COUNT_BIG siempre devuelve un valor de tipo de datos bigint.



    Clausula Group BY:

        Las clausula de group by agrupa los resultados de la instruccion SELECT segun los valores en una lista con una o varias expresiones de columna.



    Clausula HAVING :


        La clausula HAVING especifica una condicion de busqueda para un grupo o agregado. La clausula HAVING solo se puede utilizar con la instruccion
        SELECT Y GROUP BY. La clausula HAVING se agrego a SQL porque la clausula WHERE no se puede usar con las funciones agregadas.

*/


-- MAX / MIN

/*
Mostrar cual es el Empleado(Employee) con la Fecha de Nacimiento
mas antigua y mas reciente
*/


SELECT MIN(BirthDate) AS BirthDateMin, MAX(BirthDate) AS BirthDateMax
FROM HumanResources.Employee
GO


-- Consultar la Tabla HumanResources.Employee
SELECT * FROM Sales.SalesTerritory
GO


/*
Mostrar del Territorio de Ventas(SalesTerritory)
las ventas m�nimas y las ventas m�ximas del A�o
*/
SELECT MIN(SalesYTD) AS SalesYTDMin, MAX(SalesYTD) AS SalesYTDMax
FROM Sales.SalesTerritory
GO


-- SUM

/*
Calcular del Territorio de Ventas(SalesTerritory)
la Suma de las Ventas del A�o(SalesYTD) y del A�o Anterior(SalesLastYear)
*/
SELECT SUM(SalesYTD) AS SUMSalesYTD, SUM(SalesLastYear) AS SUMSalesLastYear
FROM Sales.SalesTerritory
GO



-- AVG

/*
Calcular del Territorio de Ventas(SalesTerritory)
el Promedio de las Ventas del A�o(SalesYTD) y del A�o Anterior(SalesLastYear)
*/
SELECT SUM(SalesYTD) AS SUMSalesYTD, SUM(SalesLastYear) AS SUMSalesLastYear,
		AVG(SalesYTD) AS AVGSalesYTD, AVG(SalesLastYear) AS AVGSalesLastYear
FROM Sales.SalesTerritory
GO


-- COUNT 


/*
Calcular de la Tabla Direcci�n(Address)
la cantidad total de registros por la columna AddressID, 
la cantidad total de no Nulos por la columna AddressLine2,
la cantidad total de registros Distintos por la columna City
la cantidad total de registros de la Tabla
*/
SELECT COUNT(ALL AddressID) TotalALL, COUNT(AddressID) TotalColumn,  --COUNT_BIG
		COUNT(AddressLine2) TotalNotNull, COUNT(DISTINCT City) TotalDistinct, 
		COUNT(*) Total, COUNT(1) Total1
FROM Person.Address
GO



-- GROUP BY


/*
Utilizar la Tabla de Empleados(Employee) y resolver lo siguiente:
Contar la cantidad de Empleados(Employee) que est�n Casados y Solteros
*/
SELECT * -- Error
FROM HumanResources.Employee
GROUP BY MaritalStatus
GO

SELECT MaritalStatus -- Se puede reemplazar 'Married' o 'Single'
FROM HumanResources.Employee
GROUP BY MaritalStatus
GO

SELECT MaritalStatus, COUNT(1) Total
FROM HumanResources.Employee
GROUP BY MaritalStatus
GO



-- Consultar la Tabla Sales.SalesTerritory
SELECT * FROM Sales.SalesTerritory
GO


/*
Utilizar la Tabla de SalesTerritory y resolver lo siguiente:
Calcular la Suma, Promedio, M�nimo y M�ximo de las Ventas del A�o(SalesYTD)
Agrupados por el C�digo de Regi�n del Pa�s(CountryRegionCode)
Donde el CountryRegionCode no sea igual a 'DE'
*/
SELECT CountryRegionCode, SUM(SalesYTD) TotalSUM, AVG(SalesYTD) SalesAVG,
							MIN(SalesYTD) SalesMin, MAX(SalesYTD) SalesMax
FROM Sales.SalesTerritory
WHERE CountryRegionCode <> 'DE' --Germany
GROUP BY CountryRegionCode
GO



/*


    HAVING

*/



/*
Utilizar la Tabla de Empleados(Employee) y resolver lo siguiente:
Contar la cantidad de Empleados(Employee) que est�n Casados y Solteros
Donde la cantidad sea mayor a 144
*/
SELECT MaritalStatus, COUNT(1) Total
FROM HumanResources.Employee
GROUP BY MaritalStatus
HAVING COUNT(1) > 144
GO



-- Consultar la Tabla Sales.SalesTerritory
SELECT * FROM Sales.SalesTerritory
GO



/*
Utilizar la Tabla de SalesTerritory y resolver lo siguiente:
Calcular la Suma, Promedio, M�nimo y M�ximo de las Ventas del A�o(SalesYTD)
Agrupados por el C�digo de Regi�n del Pa�s(CountryRegionCode)
Donde el CountryRegionCode no sea igual a 'DE'
y donde la Suma sea menor o igual a 6 000 000
*/
SELECT CountryRegionCode, SUM(SalesYTD) TotalSUM, AVG(SalesYTD) SalesAVG,
							MIN(SalesYTD) SalesMin, MAX(SalesYTD) SalesMax
FROM Sales.SalesTerritory
WHERE CountryRegionCode <> 'DE' --Germany
GROUP BY CountryRegionCode
HAVING SUM(SalesYTD) <= 6000000
GO