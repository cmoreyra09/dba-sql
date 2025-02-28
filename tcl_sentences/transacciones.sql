

/*

	TCL:

		Las sentencias TCL (Transaction Control Language / Lenguaje de control de Transacciones)

		es una parte de SQL que utiliza para gestionar transacciones y garantizar la integridad de los datos en una base de datos.


		Una transaccion es una unidad logica de trabajo que consta de una o mas operaciones de base de datos que se ejecutan como un todo,
		lo que significa que todas deben completarse correctamente o en caso contrario, ninguna de ellas se aplica.


		Usar la transaccion es el mejor metodo debido a que cumple con los cuatro propiedad de todo sistema de base de datos relacionales
		a estas propiedades se les conoce COMO ACID (atomicity,consistency,insolation y durability)

1. Atomicity (Atomicidad)
Se refiere a la "totalidad" de una transacción. Una transacción es una unidad de trabajo que debe ejecutarse en su totalidad o no ejecutarse en absoluto. Si ocurre un fallo, la transacción debe deshacerse completamente para evitar datos inconsistentes.

✅ Ejemplo:
Supongamos que realizas una transferencia bancaria de $100 de la cuenta A a la cuenta B. La transacción tiene dos operaciones:

Restar $100 de la cuenta A.
Sumar $100 a la cuenta B.
Si la primera operación se ejecuta, pero la segunda falla (por ejemplo, por un corte de energía), la base de datos debe revertir la primera operación para evitar que el dinero desaparezca. La transacción debe asegurarse de que ambas operaciones se realicen o ninguna de ellas.

2. Consistency (Consistencia)
Garantiza que la base de datos pase de un estado válido a otro. No importa cuántas transacciones ocurran, la integridad de los datos siempre debe mantenerse.

✅ Ejemplo:
Supongamos que una base de datos tiene una restricción que impide que el saldo de una cuenta bancaria sea negativo. Si alguien intenta retirar más dinero del que tiene, la transacción no se debe completar, manteniendo la consistencia de los datos.

3. Isolation (Aislamiento)
Asegura que múltiples transacciones que ocurren al mismo tiempo no interfieran entre sí y que la base de datos se comporte como si cada transacción se ejecutara por separado.

✅ Ejemplo:
Imagina que dos personas intentan comprar el último boleto de avión disponible al mismo tiempo. Si no hay aislamiento, ambas transacciones podrían leer la disponibilidad al mismo tiempo y ambas podrían intentar reservarlo. El aislamiento previene esto asegurando que solo una transacción pueda completar la compra antes que la otra.

4. Durability (Durabilidad)
Garantiza que una vez que una transacción ha sido confirmada, los cambios en la base de datos sean permanentes, incluso si hay fallos en el sistema.

✅ Ejemplo:
Si realizas una compra en línea y la transacción se completa, incluso si el servidor se apaga justo después, el pedido sigue registrado. Esto se logra almacenando los cambios en un log de transacciones o mediante copias de seguridad.

Resumen ACID
Propiedad				Explicación																				Ejemplo
Atomicidad				Todo o nada: Si una parte de la transacción falla, se deshacen todos los cambios.		Transferencia bancaria: Si un paso falla, el dinero no se mueve.
Consistencia			Se mantiene la integridad de los datos.													No se puede retirar más dinero del saldo disponible.
Aislamiento				Las transacciones no interfieren entre sí.												Dos usuarios no pueden comprar el mismo producto simultáneamente si solo hay uno disponible.
Durabilidad				Los cambios confirmados son permanentes.												Si se apaga el sistema después de una compra, el pedido sigue registrado.



*/



USE Northwind
GO


SELECT * FROM Customers
ORDER BY CustomerID DESC



BEGIN TRANSACTION
	
	INSERT INTO Customers
		VALUES ('RAPPI','RAPPI SA','Juan Pablo Ortega','Owner',NULL,'Bogota',NULL,NULL,'colombia',NULL,NULL);


		SELECT @@TRANCOUNT AS openTransaction
		--ROLLBACK TRANSACTION;
		COMMIT TRANSACTION
		
		SELECT @@TRANCOUNT AS openTransaction

GO


BEGIN TRANSACTION
	
	INSERT INTO Customers
		VALUES ('ZNDXT','INDITEX SA','Amancio','Owner','Av . Diputacion Edificio Inditex. N15142','coruña',NULL,NULL,'España',NULL,NULL);


		
		IF @@ROWCOUNT = 1
			
			BEGIN 
				COMMIT TRANSACTION;
				PRINT 'COMMIT TRANSACTION'
			END

		ELSE IF @@ROWCOUNT = 0
			
			BEGIN
				ROLLBACK TRANSACTION;
				PRINT 'ROLLBACK TRANSACTION'

			END

				ELSE
					BEGIN
				
						PRINT 'Fuera de Parametro'

					END

GO



BEGIN TRANSACTION 

	UPDATE Customers 
		SET ContactName = 'Amancio Ortega'
			WHERE CustomerID = 'ZNDXT'


	IF @@ROWCOUNT = 1
		BEGIN
			
			COMMIT TRANSACTION;
			PRINT 'Se comitio la transaccion'
		
		END

	ELSE IF @@ROWCOUNT = 0
		BEGIN

			ROLLBACK TRANSACTION;
			PRINT 'Se realizo el rollback'
		
		END

	ELSE 
		BEGIN
			
			PRINT 'Problemas de ejecucion.'

		END
GO



BEGIN TRANSACTION 

	DELETE FROM Customers
		WHERE CustomerID = 'ZNDXT'

	IF @@ROWCOUNT = 1
		BEGIN
			
			COMMIT TRANSACTION;
			PRINT 'Se comitio la transaccion, Se elimino '
		
		END

	ELSE IF @@ROWCOUNT = 0
		BEGIN

			ROLLBACK TRANSACTION;
			PRINT 'Se realizo el rollback'
		
		END

	ELSE 
		BEGIN
			
			PRINT 'Problemas de ejecucion.'

		END
GO