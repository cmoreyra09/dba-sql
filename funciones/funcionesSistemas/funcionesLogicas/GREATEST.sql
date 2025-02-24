
/*

    GREATEST :

        Devuelve el valor maximo de una lista de una o varias expresiones


*/


select GREATEST(EmployeeID) from Northwind.dbo.Employees


SELECT GREATEST('6.6', 3.152, 20) AS Resultado; --Devuelve el numero mayor

SELECT GREATEST('30.8', 3.152, 20) AS Resultado; --Devuelve el numero mayor

SELECT GREATEST('Bienvenido', 'Hasta Luego', 'Hola') AS Resultado; --Devuelve el mayor Caracter Lexicogr�fica
GO