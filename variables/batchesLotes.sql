/*

	Batches (Lotes)

	Un batch o lote de instruccion es una coleccion de una o mas instrucciones Transact - SQL 
	enviadas al servidor para ejecucion como una sola unidad los batches permiten agrupar y enviar multiples instrucciones SQL al servidor en una sola operaicon,
	lo cual puede mejorar la eficiencia y la gestion de codigo SQL


	El batch o lote terminan con la instruccion GO por defecto 

	Los batch o Lote Limitan el alcance de las variables.


	La instruccion go fue introducido por la herramientas de microsoft como una forma de separar declaraciones por lotes, la instruccion go es compatible con las herramientas
	de sql server pero formalmente no forma parte de otras herramientas .

	SELECT * FROM TABLA 
	GO

	Algo importante a aclara es el punto y coma la cual se utiliza para indicar el final de una declaracion en si, no necesariamiente de un lote completo.
	Ademas es un estandar en SQL y ayuda a evitar ambiguedades en la interpretacion de las intrucciones.

	SELECT * FROM TABLA ;

*/


USE Northwind
GO


SELECT * FROM Customers
GO
SELECT * FROM Clientes
GO
SELECT * FROM Employees
GO


SELECT * FROM Customers;
SELECT * FROM Clientes;
SELECT * FROM Employees;
