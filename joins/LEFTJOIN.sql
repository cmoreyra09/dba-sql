/*

    LEFT JOIN :

    La clausula LEFT JOIN (Join Externo), tambien conocido como left outer join se utiliza para combinar filas de dos tablas 
    de manera que devuelve todas las filas de la tabla de la izquierda la primera tabla mencionada y las filas coincidentes
    de la tabla de la derecha la segunda tabla mencionada. Si no hay ninguna coincidencia en la tabla derecha,
    devuelven NULL para las columnas de la tabla de la derecha.




*/


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
		LEFT JOIN Sales.Customer AS S ON P.BusinessEntityID = S.PersonID
		
		
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
			LEFT JOIN (  SELECT DISTINCT PersonID, CustomerID,StoreID, AccountNumber FROM Sales.Customer) AS S 
			ON P.BusinessEntityID = S.PersonID;
		END
	ELSE
		BEGIN
			PRINT 'Error de Opcion'
		END
END
COMMIT TRANSACTION
GO