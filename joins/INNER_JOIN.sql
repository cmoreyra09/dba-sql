/*

    INNER JOIN :

        La clausula INNER JOIN (Join Interno) Se utiliza para combinar filas de dos o mas tablas
        basadas en una condicion que especifica una relacion entre columnas de las tablas.

        La clausula INNER JOIN devuelve solo aquellas filas que tienen coincidencias en ambas tablas
        segun la condicion de union especificada.


*/


/*

USE AdventureWorks2022
GO

*/

/* INNER JOIN */

BEGIN TRANSACTION

DECLARE @option AS TINYINT SET @option = 1

BEGIN

	IF @option = 1
		BEGIN
		SELECT 
			P.BusinessEntityID,
			P.FirstName,
			P.MiddleName,
			P.LastName,
			S.CustomerID,
			S.PersonID,
			S.StoreID,
			S.AccountNumber
			FROM Person.Person AS P
		INNER JOIN Sales.Customer AS S ON P.BusinessEntityID = S.PersonID
		
		
		END
	IF @option = 2
		BEGIN
			SELECT 
			P.BusinessEntityID,
			P.FirstName,
			P.MiddleName,
			P.LastName,
			S.CustomerID,
			S.PersonID,
			S.StoreID,
			S.AccountNumber
			FROM Person.Person AS P
			INNER JOIN (  SELECT DISTINCT PersonID, CustomerID,StoreID, AccountNumber FROM Sales.Customer) AS S 
			ON P.BusinessEntityID = S.PersonID;
		END
	ELSE
		BEGIN
			PRINT 'Error de Opcion'
		END
END
COMMIT TRANSACTION
GO