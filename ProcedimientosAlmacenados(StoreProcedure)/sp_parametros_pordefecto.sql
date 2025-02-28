--Ejecutar el Procedimiento Almacenado con par�metro
EXEC SP_002_EmployeeInformation 1991
GO


--Agregar un valor por defecto al par�metro
CREATE OR ALTER PROC SP_002_EmployeeInformation
(
	@year SMALLINT = 1984
)
AS
BEGIN
	SELECT  E.JobTitle,
			P.FirstName + ' ' + P.LastName Name,
			E.BirthDate, YEAR(E.BirthDate) Year,
			MONTH(E.BirthDate) Month, DAY(E.BirthDate) Day,
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
	WHERE YEAR(E.BirthDate) = @year
	ORDER BY YEAR(E.BirthDate)
END
GO


--Ejecutar el Procedimiento Almacenado con par�metro por defecto y opcional
EXEC SP_002_EmployeeInformation
GO

EXEC SP_002_EmployeeInformation 1990
GO


--Agregar otro par�metro y un valor por defecto
CREATE OR ALTER PROC SP_002_EmployeeInformation
(
	@year SMALLINT = 1984,
	@gender CHAR(1) = 'F' 
)
AS
BEGIN
	SELECT  E.JobTitle,
			P.FirstName + ' ' + P.LastName Name,
			E.BirthDate, YEAR(E.BirthDate) Year,
			MONTH(E.BirthDate) Month, DAY(E.BirthDate) Day,
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
	WHERE YEAR(E.BirthDate) = @year AND E.Gender = @gender
	ORDER BY YEAR(E.BirthDate)
END
GO


--Ejecutar el Procedimiento Almacenado con par�metro por defecto y opcional
EXEC SP_002_EmployeeInformation
GO

EXEC SP_002_EmployeeInformation 1990, 'M'
GO