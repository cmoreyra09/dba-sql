
/*

    Operadores Aritmeticos :

    Los operadores aritmeticos se utiliza para realizar calculos y operaciones aritmeticas en los operandos o los datos presentes
    en las tablas de la bases de datos.


    (1) Operador + : Suma dos valores
    (2) Operador - : Resta dos valores
    (3) Operador * : Multiplica dos valores
    (4) Operador / : Divide dos valores
    (5) Operador % : Modulo de dos valores


*/



-- (1) Suma de dos valores  :
/*
Descripcion : 
    Eloperadore de suma se utiliza para realizar operaciones de suma en los operandos
*/

/* 

	Consultar el nombre y el precio de los productos
	Aumentar  en 10 el precio
	Disminuir en 10 el precio

*/

SELECT 
	P.ProductName,
	P.UnitPrice,
	P.UnitPrice + 10 AS Resultado_Aumentado,
	P.UnitPrice - 10 AS Resultado_Disminuido
FROM  Products AS P;

/* Mostrar el nombre, precio y stock de los productos aumentar el precio en 15 donde el stock sea menor a 10 */
SELECT ProductName, UnitPrice, UnitsInStock, UnitPrice + 15  AS Result1 FROM Products WHERE UnitsInStock < 10;


-- (2) Resta de dos valores :
/*
El operador Resta se usa para realizar operacioens de resta en las operandos
*/

/*
Consultar la fecha de pedido order date de la tabla orders y aumentar 1 dia la fecha de pedido order date 
disminuir en 5 dias de la fecha de pedido order date 
*/
SELECT
	OrderDate,
	OrderDate + 1 AS Result1,
	OrderDate - 5 AS Result2
	FROM Orders;


/* Mostrar el nombre , precio y stock de los productos y restar el precio en 2 donde el stock sea mayor a 100 */
SELECT ProductName, UnitPrice, UnitsInStock , UnitsInStock - 2  AS Result1 FROM Products WHERE UnitsInStock > 100;


/* 
	Nota importante :
	-- Cuando una columna tiene formato fecha se puede realizar sumas aritmeticas dentro de esa columnas porque automaticamente el formato reconoce la suma nivel de dias.
*/


-- (3) Multiplicacion de dos valores :
/*
Operador de multiplicacion se utiliza para realizar operaciones de multiplicacion en los operandos
*/


/* Consultar el nombre precio y stock de los productos , calcular el coste de inventario */

SELECT
	P.ProductName,
	P.UnitPrice,
	P.UnitsInStock,
	P.UnitPrice * UnitsInStock AS CosteInventario 
		FROM Products AS P



-- (4) Division de dos valores :
/*
El operador de division se utiliza para realizar operaciones de division en los operandos
*/
/* Mostrar la cantidad, precio y stock de la tabla order details, calcular el monto total (Cantidad * Precio - Descuento )*/
SELECT
	Quantity,
	UnitPrice,
	Discount,
	UnitPrice * (UnitPrice - (UnitPrice - Discount)) AS MontoTotal
	FROM [Order Details]