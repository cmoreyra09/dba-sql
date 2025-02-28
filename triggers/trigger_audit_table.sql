---------------------------------
--    Usar la Base de Datos    --
---------------------------------
USE tempdb;
GO




-----------------------------------
--    CREAR LA TABLA CLIENTES    --
-----------------------------------
CREATE TABLE CLIENTES(
	id							TINYINT PRIMARY KEY,
	nombre						VARCHAR(20)	,
	paterno						VARCHAR(20),
	materno						VARCHAR(20),
	edad						TINYINT,
	FechaEjecucionInsert		DATETIME	NOT NULL DEFAULT GETDATE(),
	UsuarioEjecucionInsert		VARCHAR(40) NOT NULL DEFAULT SYSTEM_USER,
	PcEjecucionInsert			VARCHAR(40) NOT NULL DEFAULT HOST_NAME(),

	CONSTRAINT chk_edad CHECK(edad >= 0 AND edad <= 120)
);
GO


--------------------------------------------------
--    CREAR TRIIGER - INSERT, DELETE, UPDATE    --
--------------------------------------------------
CREATE OR ALTER TRIGGER tgr_insert_clientes
ON CLIENTES
FOR INSERT, DELETE, UPDATE
AS
BEGIN
	
	SELECT * INTO insertado FROM inserted;

	SELECT * INTO eliminado FROM deleted;

END;
GO




-----------------------------
--    INSERTAR REGISTRO    --
-----------------------------
INSERT INTO CLIENTES(id, nombre, paterno, materno, edad)
			 VALUES (101, 'Isabel', 'Campos', 'Torres', 19),
					(102, 'Marco', 'Gallegos', 'Ochoa', 35),
					(103, 'Julia', 'Gamboa', 'Gallegos', 35);
GO




---------------------------------------------------------------
--    CONSULTAR LAS TABLAS CLIENTES, INSERTADO, ELIMINADO    --
---------------------------------------------------------------
SELECT * FROM CLIENTES;
SELECT * FROM insertado;
SELECT * FROM eliminado;
GO




-----------------------------------------------------
--    ELIMINAR LAS TABLAS INSERTADO Y ELIMINADO    --
-----------------------------------------------------
DROP TABLE insertado;
DROP TABLE eliminado;
GO




----------------------------------------------------
--    ALTERAR TRIIGER - INSERT, DELETE, UPDATE    --
----------------------------------------------------
CREATE OR ALTER TRIGGER tgr_insert_clientes
ON CLIENTES
FOR INSERT, DELETE, UPDATE
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT * INTO insertado FROM inserted;

	SELECT * INTO eliminado FROM deleted;

END;
GO




-------------------------------------------
--    CONSULTAR EL CLIENTE A ELIMINAR    --
-------------------------------------------
SELECT * FROM CLIENTES WHERE id = 103;
GO




------------------------------------------
--    ELIMINAR EL CLIENTE CON ID 103    --
------------------------------------------
DELETE FROM CLIENTES WHERE id = 103;
GO




---------------------------------------------------------------
--    CONSULTAR LAS TABLAS CLIENTES, INSERTADO, ELIMINADO    --
---------------------------------------------------------------
SELECT * FROM CLIENTES;
SELECT * FROM insertado;
SELECT * FROM eliminado;
GO




-----------------------------------------------------
--    ELIMINAR LAS TABLAS INSERTADO Y ELIMINADO    --
-----------------------------------------------------
DROP TABLE insertado;
DROP TABLE eliminado;
GO




---------------------------------------------
--    CONSULTAR EL CLIENTE A ACTUALIZAR    --
---------------------------------------------
SELECT * FROM CLIENTES WHERE id = 101;
GO




--------------------------------------------
--    ACTUALIZAR EL CLIENTE CON ID 101    --
--------------------------------------------
UPDATE CLIENTES 
SET nombre = 'Karen'
WHERE id = 101;
GO




---------------------------------------------------------------
--    CONSULTAR LAS TABLAS CLIENTES, INSERTADO, ELIMINADO    --
---------------------------------------------------------------
SELECT * FROM CLIENTES;
SELECT * FROM insertado;
SELECT * FROM eliminado;
GO




----------------------------------------------------
--    ELIMINAR EL TRIGGER DE LA TABLA CLIENTES    --
----------------------------------------------------
DROP TRIGGER tgr_insert_clientes
GO




---------------------------------------------------------------
--    ELIMINAR LAS TABLAS CLIENTES, INSERTADO Y ELIMINADO    --
---------------------------------------------------------------
DROP TABLE CLIENTES;
DROP TABLE insertado;
DROP TABLE eliminado;
GO