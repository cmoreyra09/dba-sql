/*


    SELF JOIN :

    La clausula self join en sql server no existe como tal,
    sino es una tecnica en la que una tabla se une consigo mismo. Esto se utiliza cuando se desea comparar filas dentro de la misma
    tabla o cuando los datos en una sola tabla necesitan ser relacionados entre si de alguna manera. Para realizar un self join
    se usan alias de tabla para diferencia las diferentes instancias de la misma tabla.


    Un caso tipico de uso de self join es en una tabla de empleados donde cada empleado tiene un campo de indentificacion de su
    gerente. 



*/


-- Utilizar la Base de Datos NORTHWND
USE NORTHWND
GO


-- Consultar la Tabla Employees
SELECT * FROM Employees
GO


-- Consulta con columnas espec�ficas
SELECT EmployeeID, LastName + ' ' + FirstName AS Name,
		Title, ReportsTo
FROM Employees
GO


-- ==========================
-- SELF JOIN(Auto Uni�n)
-- ==========================
-- ANSI SQL-92
SELECT E.EmployeeID, E.LastName + ' ' + E.FirstName AS Name, --Empleado
		E.Title, E.ReportsTo,
		S.EmployeeID, S.LastName + ' ' + S.FirstName AS Name, --Supervisor
		S.Title, S.ReportsTo
FROM Employees AS S INNER JOIN Employees AS E
ON S.EmployeeID = E.ReportsTo
GO