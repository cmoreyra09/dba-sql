---------------------------------
--    Usar la Base de Datos    --
---------------------------------
USE tempdb
GO




-----------------------------------
--    CREAR LA TABLA PRODUCTOS    --
-----------------------------------
CREATE TABLE PRODUCTOS(
	id_producto		TINYINT PRIMARY KEY,
	nombre			VARCHAR(50),
	stock			VARCHAR(20)
	CONSTRAINT chk_stock CHECK(stock >= 0)
)
GO




------------------------------------------
--    CREAR LA TABLA DETALLE FACTURA    --
------------------------------------------
CREATE TABLE DETALLE_FACTURA(
	codigo		CHAR(4),
	id_producto	TINYINT FOREIGN KEY REFERENCES PRODUCTOS(id_producto),
	precio		DECIMAL(7,2),
	cantidad	SMALLINT
	CONSTRAINT chk_cantidad CHECK(cantidad >= 0),
	PRIMARY KEY (codigo, id_producto)
)
GO




----------------------------------
--    INSERTAR LOS PRODUCTOS    --
----------------------------------
INSERT INTO PRODUCTOS (id_producto, nombre, stock)
			   VALUES (101, 'Monitor LG 27 pulgadas', 50),
					  (102, 'Mouse Logitech G502', 100),
					  (103, 'SSD Kingston 960GB', 50);
GO




--------------------------------------------
--    CREAR TRIGGER PARA REDUCIR STOCK    --
--------------------------------------------
CREATE OR ALTER TRIGGER tgr_stock_modificados
ON DETALLE_FACTURA
AFTER UPDATE, INSERT, DELETE
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE	PRODUCTOS
	SET		stock = stock + total_cantidad
	FROM	(
			SELECT id_producto AS id, SUM(cantidad) AS total_cantidad
			FROM	(
					SELECT id_producto, -cantidad AS cantidad FROM Inserted
					UNION ALL
					SELECT id_producto, cantidad FROM Deleted
					) T
			GROUP BY id_producto
			) A
	WHERE id_producto = A.id;

END
GO




-------------------------------------------------
--    CONSULTAR PRODUCTOS Y DETALLE FACTURA    --
-------------------------------------------------
SELECT * FROM PRODUCTOS;
SELECT * FROM DETALLE_FACTURA;
GO




------------------------------------------------
--    INSERTAR REGISTRO EN DETALLE FACTURA    --
------------------------------------------------
INSERT INTO DETALLE_FACTURA (codigo, id_producto, precio, cantidad)
					 VALUES ('F101', 101, 499.90, 10),
							('F101', 102, 89.90, 20),
							('F102', 102, 89.90, 40),
							('F103', 103, 99.90, 10);
GO




-------------------------------------------------
--    CONSULTAR PRODUCTOS Y DETALLE FACTURA    --
-------------------------------------------------
SELECT * FROM PRODUCTOS;
SELECT * FROM DETALLE_FACTURA;
GO




------------------------------------------------
--    ELIMINAR REGISTRO EN DETALLE FACTURA    --
------------------------------------------------
DELETE FROM DETALLE_FACTURA 
WHERE codigo = 'F101' AND id_producto = 101;
GO

DELETE FROM DETALLE_FACTURA 
WHERE codigo = 'F101' AND id_producto = 102;
GO




-------------------------------------------------
--    CONSULTAR PRODUCTOS Y DETALLE FACTURA    --
-------------------------------------------------
SELECT * FROM PRODUCTOS;
SELECT * FROM DETALLE_FACTURA;
GO




--------------------------------------------------
--    ACTUALIZAR REGISTRO EN DETALLE FACTURA    --
--------------------------------------------------
UPDATE	DETALLE_FACTURA
SET		cantidad = 30
WHERE	codigo = 'F103' AND id_producto = 103;
GO




-------------------------------------------------
--    CONSULTAR PRODUCTOS Y DETALLE FACTURA    --
-------------------------------------------------
SELECT * FROM PRODUCTOS;
SELECT * FROM DETALLE_FACTURA;
GO




-----------------------------------------------------------
--    ELIMINAR EL TRIGGER DE LA TABLA DETALLE_FACTURA    --
-----------------------------------------------------------
DROP TRIGGER tgr_stock_modificados
GO




-----------------------------------------------------------
--    ELIMINAR LAS TABLAS DETALLE_FACTURA Y PRODUCTOS    --
-----------------------------------------------------------
DROP TABLE DETALLE_FACTURA;
DROP TABLE PRODUCTOS;
GO