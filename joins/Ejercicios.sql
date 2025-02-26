-- Usar la Base de Datos AdventureWorks2022
USE AdventureWorks2022
GO


-- Consultar las Tablas:
SELECT * FROM Production.Product;
SELECT * FROM Production.ProductSubcategory;
SELECT * FROM Production.ProductCategory;


/*
Mostrar los productos, la subcategor�a y la categor�a a la que pertenecen. (1)
*/

/*
Mostrar los productos que NO pertenecen a una subcategor�a. (2)
*/

/*
Mostrar las siguientes informaciones de los empleados: (3)
- Cargo, Nombre, Fecha de Nacimiento
- Estado Civil, Genero, 
- N�mero de tel�fono y su tipo de n�mero del tel�fono
- Email, el departamento y al grupo que se encuentra asignado.
*/

BEGIN TRANSACTION 

	DECLARE @option AS TINYINT SET @option = 3;

	IF @option = 1
		BEGIN 
			
			SELECT  
				P.ProductSubcategoryID,
				P.Name,
				P.Color,
				S.Name AS nombreSubcategoria,
				S.ProductCategoryID AS idsubCategoria,
				C.ProductCategoryID AS idCategoria,
				C.Name AS nombreCategoria
					FROM Production.Product AS P
						INNER JOIN Production.ProductSubcategory AS S ON P.ProductSubcategoryID = S.ProductSubcategoryID
						INNER JOIN Production.ProductCategory AS C ON S.ProductCategoryID = C.ProductCategoryID		
		END

	IF @option = 2
		BEGIN

					SELECT  
				P.ProductSubcategoryID,
				P.Name,
				P.Color,
				S.Name AS nombreSubcategoria,
				S.ProductCategoryID AS idsubCategoria,
				C.ProductCategoryID AS idCategoria,
				C.Name AS nombreCategoria
					FROM Production.Product AS P
						LEFT JOIN Production.ProductSubcategory AS S ON P.ProductSubcategoryID = S.ProductSubcategoryID
						LEFT JOIN Production.ProductCategory AS C ON S.ProductCategoryID = C.ProductCategoryID
							WHERE S.ProductSubcategoryID IS NULL


		END

	IF @option = 3
		BEGIN

				SELECT  
					E.JobTitle,
					P.FirstName + ' ' + LastName Name,
					DATENAME(weekday, E.BirthDate) + ' ' + CAST(DAY(E.BirthDate) AS CHAR(2)) + ' de ' + DATENAME(month, E.BirthDate) + ' del ' + CAST(YEAR(E.BirthDate) AS CHAR(4)) AS BirthDate,
					IIF(E.MaritalStatus = 'S', 'Single', 'Married') MaritalStatus,
					IIF(E.Gender = 'M', 'Male', 'Female') Gender,
					PP.PhoneNumber, PNT.Name Type,
					PE.EmailAddress Email,
					D.Name Department,
					D.GroupName GroupDepartment
						FROM HumanResources.Employee E 
							INNER JOIN Person.Person P ON P.BusinessEntityID = E.BusinessEntityID
							INNER JOIN Person.PersonPhone PP ON P.BusinessEntityID = PP.BusinessEntityID
							INNER JOIN Person.PhoneNumberType PNT ON PNT.PhoneNumberTypeID = PP.PhoneNumberTypeID
							INNER JOIN Person.EmailAddress PE ON P.BusinessEntityID = PE.BusinessEntityID
							INNER JOIN HumanResources.EmployeeDepartmentHistory EDH ON E.BusinessEntityID = EDH.BusinessEntityID
							INNER JOIN HumanResources.Department D ON EDH.DepartmentID = D.DepartmentID

		END

	ELSE
		PRINT 'Error al escoger una opcion'


COMMIT TRANSACTION
GO