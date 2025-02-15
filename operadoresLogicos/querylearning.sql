
/*

    Operadores Logicos : 
  
    Los operadores logicos se utilizan para combinar multiples condiciones en una consulta y evaluar si se cumplen todas o algunas de ellas.
    Estos operadores logicos devuelven el tipo de datos booleano (verdadero o falso) que indica si la comparacion es cierta.

    Operadores Logicos para utilizar en las sentencias DML

    (1) AND 
    (2) OR
    (3) IN
    (4) LIKE
    (5) BETWEEN
    (6) NOT


*/



-- (1) Operador Logico "AND"
/*
Combina dos expresiones booleanas y devuelve TRUE cuando ambas expresiones son TRUE. Cuando se usa mas de un operador logico en una instruccion,en primer lugar se evalua el operadores AND. 
*/
/* (a) Mostrar los clientes que son del pais brazil y la ciudad de RIO DE JANEIRO */
/* (b) Mostrar los Productos, Donde el precio sea mayor o igual a 40 y el stock sea menor o igual a 20 Ordenado de manera ASC*/
SELECT * FROM Customers WHERE Country = 'brazil' AND City = 'Rio de Janeiro'
SELECT * FROM Products  WHERE UnitPrice >= 40  AND UnitsInStock <= 20 ORDER BY CategoryID ASC


-- (2) Operador Logico "OR"}
/*
Combina dos expresiones booleanas y devuelve TRUE cuando una de las expresiones es TRUE. Cuando en una instruccion se utiliza mas de un operador logico, los operadores OR se evaluan despues
de los operadores AND . Sin embargo, se puede cambiar el orden de evaluacion gracias a los parentesis.
*/
/* Mostrar los clientes que son del pais de Mexico o Argentina*/
/* Mostrar los clientes que son del pais France y la ciudad de Paris o el pais Austria */
SELECT * FROM Customers WHERE Country = 'Mexico' OR Country = 'Argentina';
SELECT * FROM Customers WHERE Country = 'France' OR Country = 'Paris' OR Country = 'Austria';


-- (3) Operador Logico "IN"
/*
Devuelve un valor TRUE si el resultado coincide con algun valor de una subconsulta o una lista. Te devuelve el conjunto de datos que tenga un valor
*/
/* Mostrar los clientes que sean de la ciudad de Sao Paulo, Madrid, Lisboa o Tokio */
/* Mostrar los Productos Donde el precio sea "10,20,30 o 40" Ordenando de manera Ascendente por el precio */
SELECT * FROM Customers WHERE City IN ('Sao Paulo','Madrid','Lisboa','Tokio')
SELECT * FROM Products  WHERE UnitPrice IN ( 10,20,30,40 )


-- (4) Operador Logico "LIKE"
/*
Se usa para poder determinar si una cadena de caracteres especifica coincide con una patron especifico. Es decir, se utiliza para buscar un patron especifico de una columna
El operador LIKE devuelve un valor TRUE si la expresion coincide con el calor del patron especifico
*/

/* Consultar los datos de la tabla clientes, Donde el nombre   del contacto    inicie con el nombre "Carlos" */
/* Consultar los datos de la tabla clientes, Donde el cargo    (Contact Title) Termine con la palabra Manager  */
/* Consultar los datos de la tabla clientes, Donde el contacto (ContactName)   contenga la palabra pedor */

SELECT * FROM Customers WHERE ContactName  LIKE 'Carlos%' -- Inicie Palabra Carlos
SELECT * FROM Customers WHERE ContactTitle LIKE '%Manager'
SELECT * FROM Customers WHERE ContactName  LIKE '%Pedro%'


-- (5) Operador Logico "BETWEEN"
/*
Devuelve TRUE si el valor es mayor o igual que el valor de la expresion inicial y menor o igual que el valor de la expresion final. 
Es decir, el operadore "BETWEEN" devuelve un valor TRUE si el valor esta dentro de un intervalo
*/
 
 /* Consultar los productos donde el precio se encuentre en el rango de 10 hasta 20 */
SELECT * FROM Products AS P WHERE P.UnitPrice BETWEEN 10 AND 20 ;
/* Consultar los datos de la tabla pedido donde la fecha orden se encuentre en el rango 01-09-1996 hasta el 31-10-1996 */
SELECT * FROM Orders AS O WHERE CONVERT(NVARCHAR,CAST(O.OrderDate AS DATETIME2),112) BETWEEN 19960910 AND 19961031;
/* Consultar los datos de la tabla pedido donde el pais de envio se encuentre en el rango de germany hasta mexico */
SELECT * FROM Orders AS O WHERE O.ShipCountry BETWEEN 'Germany' AND 'Mexico';
/* Mostrar los datos de la tabla productos Products donde el stock se encuentre en el rango de 20 hasta 30 */
SELECT * FROM Products AS P WHERE P.UnitsInStock BETWEEN 20 AND 30;
/* Consultar los datos de la tabla ordenes . donde la fecha de envio se encuentre en el rango 01-01-1998 hasta 01-03-1998 */
SELECT * FROM Orders AS O WHERE CONVERT(NVARCHAR,CAST(O.OrderDate AS DATETIME2),112) BETWEEN 19980101 AND 19980301;


-- (6) Operador Logico "NOT"

/*
Descripcion : 
    Se utiliza en combinacion con otros operadores para dar el resultado opuesto.
    Sintaxis : 
    

*/

/* Consultar los empleados que no sean del pais de usa */
SELECT * FROM Employees AS E WHERE E.Country NOT IN ('USA');
/* Consultar los Clientes que no sean del pais de USA, spain, france, brazil */
SELECT * FROM Customers AS C WHERE C.Country NOT IN ('USA','SPAIN','FRANCE','BRAZIL');
/* Mostrar los datos de la tabla productos donde el stock no sea mayor o igual a 20 */
SELECT * FROM Products  AS P WHERE P.UnitsInStock < 20 ORDER BY P.UnitsInStock DESC ;
/* Mostar los clientes donde el telefono no empiece por abrir parentesis */
SELECT * FROM Customers AS C WHERE C.Phone NOT LIKE '(%';


