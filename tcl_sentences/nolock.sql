/*

	NOLOCK 

		Se utiliza para deshabilitar los bloques en las filas que se estan leyendo. Cuando se usa NOLOCK, se permite
		que las consultas lena datos que aun no han sido confirmados por otras transacciones. Esto puede mejorar el rendimiento
		al evitar los bloqueo, pero tambien puede llevar a obtener resultados inconsistentes o datos temporales que podrian
		revertirse en caso de un rollback.

	Caracteristicas :
		
		 - Lectura de bloque
		 - Posibles Lecturas sucias
		 - Inconsistencia



    Esto permite poder acceder a los datos cuando una tabla se encuentra en una trasaccion o se interactua.

*/


BEGIN TRANSACTION

	UPDATE Customers 
		SET ContactName = 'BILL GATES'
			WHERE CustomerID = 'ZMICO'

	SELECT * FROM Orders
		CROSS JOIN [Order Details]

	ROLLBACK TRANSACTION;
GO


SELECT * FROM Customers (NOLOCK)
GO