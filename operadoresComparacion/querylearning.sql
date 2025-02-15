


/* Operadores de Comparacion */


/*

Indices

1- Comparacion de Igualdad ( = )

2- Operador de comparacion "Mayor que" ( > )

3- Operador de comparacion "Mayor o igual que" ( >= )

4- Operador de comparacion "Menor que" ( < )

5- Operador de comparacion "Menor que o igual que" ( <= )

6- Operador de comparacion "No es igual a" ( <> , != )

7- Operador de comparacion "No es menor que" ( !< )

8- Operador de comparacion "No es mayor que" ( !> )


Operadores de Comparacion para utilizar en las sentencias DML


Los operadores de comparacion son utilizados para comparar valores en una consulta y devolver un resultado booleano (verdadero o falso ). que indica si la compracion es cierta.


=     - Igual a
>     - Mayor que
<     - Menor que

>=    - Mayor o igual que
<=    - Menor o igual que


<>    - No es igual a
!=    - Noes igual a (No es del estandar ISO)
!<    - No es menor que (No es del estandar ISO)
!>    - No es mayor que (No es del estandar ISO)

*/

RESTORE DATABASE Northwind
FROM DISK = 'C:\Users\Carlos\projects\sql-server\databases\Northwind.BAK'
WITH 
    MOVE 'Northwind' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Northwind.mdf',
    MOVE 'Northwind_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Northwind_log.ldf',
    REPLACE, 
    RECOVERY;
GO




-- (1) Comparacion de Igualdad ( = )

/* Mostrar los clientes que sean de alemania */

SELECT * FROM Customers WHERE Country = 'Germany';

/* Mostrar los clientes que sean de españa */

SELECT * FROM Customers WHERE Country = 'Spain';

/* Mostrar el nombre de la compañia (companyName) el contacto (ContactName) y la direccion (Address) de los clientes (Customers) que sean de Mexico */

SELECT 
	C.CompanyName,
	C.ContactName,
	C.Address
	FROM Customers AS C
		WHERE Country = 'Mexico';




-- (2) Operador de comparacion "Mayor que" ( > )

/*
Compara dos expresiones, cuando se compara expresiones no NULL, el resultado es TRUE si el operando de la izquierda tiene un valor mayor
que el de la derecha, de lo contrario el resultado es FALSE.
*/


/* Mostrar los productos que se tengan un precio mayor de 97 */
SELECT * FROM Products WHERE UnitPrice > 17
/* Mostrar el nombre , el precio y el stock de los productos que tengan un stock mayor a 50 */
SELECT 
		P.ProductName,
		P.UnitPrice,
		P.UnitsInStock
		FROM Products AS P
			WHERE P.UnitsInStock > 50;


-- (3) Operador de comparacion "Mayor o igual que" ( >= )
/*
    Descripcion :
    Compara dos expresiones cuando se comparan expresiones no nulas, el resultado es TRUE si el operando de la izquierda tiene un valor mayor o igual a del operando de la derecha; de otra forma, 
    el resultado es FALSE.
*/
-- Preguntas 
/* Mostrar los Productos que tengan un precio mayor o igual a 97 */
SELECT * FROM Products WHERE UnitPrice >= 97;
/* Mostrar el nombre, el precio y el stock de los productos que tengan un stock mayor o igual que 115 ordenado por de manera ascendente por el stock */
	SELECT 
			 P.ProductName,
			 P.UnitPrice,
			 P.UnitsInStock
				FROM Products AS P
					WHERE UnitsInStock >= 115;


-- (4) Operador de comparacion "Menor que" ( < )
/*
    Descripcion :
    Compara dos expresiones, cuando se comparan expresiones no nulas, el resultado es TRUE si el operando de la izuqierda tiene un valor mayor o igual al del operando de la derecha; de otra forma, el resultado es FALSE.
*/
--Preguntas
/* Mostrar los productos que tengan un precion menor que 10 */
SELECT * FROM Products WHERE UnitPrice < 10;
/* Mostrar el nombre, el precio y el stock de los productos que tengan un stock menor a 10 */
SELECT P.ProductName, P.UnitPrice, P.UnitsInStock FROM Products AS P WHERE P.UnitsInStock < 10;



-- (5) Operador de comparacion "Menor que" ( <= )
/*
Descripcion :
Compara dos expresiones, cuando se comparan expresiones que no son null, el resultado es TRUE, si el operando izquierdo tiene un valor menor o igual que el operando derecho; en caso contrario , el resultado es FALSE
*/
--Preguntas
/* Mostrar los productos que tengan un precio menor o igual que 10 */
SELECT * FROM Products WHERE UnitPrice <= 10;
/* Mostrar el nombre, el precio y el stock de los productos que tengan un stock menor o igual a 10 Ordenado de manera Descendente Por el stock*/ 
SELECT 
	P.ProductName,
	P.UnitPrice,
	P.UnitsInStock
		FROM Products AS P
			WHERE UnitPrice  <= 10
				ORDER BY P.UnitsInStock DESC;


-- (6) Operador de comparacion "No es igual a" ( <> , != )
/*
Descripcion :
Compara dos expresiones, cuando se comparan expresiones que no son NULL, el resultado es TRUE si el operando de la izquierda es distinto
del operando de la derecha; de lo contrario el resultado es False
*/
/*Mostrar los productos donde el valor del campo discontinued no es igual a 0 */
SELECT * FROM Products WHERE Discontinued <> 0 ; /* No es igual a 0*/
-- <> operador correspondiente al estandar ISO
SELECT * FROM Products WHERE Discontinued != 0 ;
-- Operador por defecto
/* Mostrar el contacto, la direccion, el pais, y el telefono de los clientes donde el pais es diferente a usa. Ordenado por de manera Ascendente por el pais. */

SELECT	
	C.ContactName,
	C.Address,
	C.CustomerID,
	C.Country
		FROM Customers AS C
			WHERE Country <> 'USA'


SELECT	
	C.ContactName,
	C.Address,
	C.CustomerID,
	C.Country
		FROM Customers AS C
			WHERE Country != 'USA'


-- (7) Operador de comparacion "No es menor que" ( !< )
/*
Descripcion :
Compara dos expresiones, cuando se comparan expresiones no Null, el resultado es TRUE si el operando de la izquierda no tiene un valor menor que el de la derecha; delo contrario, el resultado es FALSE
*/
/* Mostrar los productos donde los precioes no es menor que 100 */ 
SELECT  * FROM Products AS P WHERE P.UnitPrice  !< 100 -- Es decir es mayor a 100
/* Mostrar el nombre, el precio y el stock de los productos donde el stock no es menor que 100 */
SELECT P.ProductName, P.UnitPrice, P.UnitsInStock FROM Products AS P WHERE P.UnitPrice !< 100




-- (8) Operador de comparacion "No es mayor que" ( !> )
/*
Descripcion:
Compaara dos expresiones, cuando se comparan expresiones no NULL, el resultado es TRUE si el operando de la izquierda no tiene un valor mayor que el operando de la derecha, en caso contrario el resultado es FALSE.
*/
/* Mostrar los productos no es mayor a 10*/
SELECT * FROM Products WHERE UnitPrice !> 10
/* Mostrar el nombre, el precio y el stock de los productos donde el stock no es mayor que 100 ordenado de manera Descendente */
SELECT
	P.ProductName,
	P.UnitPrice,
	P.UnitsInStock
		FROM Products AS P
			WHERE P.UnitsInStock !> 100;


