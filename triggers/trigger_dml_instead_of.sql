---------------------------------
--    Usar la Base de Datos    --
---------------------------------
USE tempdb;
GO




-----------------------------------
--    CREAR LA TABLA PADRES    --
-----------------------------------
CREATE TABLE PADRES(
  id_padre	SMALLINT PRIMARY KEY,
  nombre	VARCHAR(10) NOT NULL
);
GO




-----------------------------------
--    CREAR LA TABLA HIJOS1    --
-----------------------------------
CREATE TABLE HIJOS1(
  id_hijo1	SMALLINT PRIMARY KEY,
  id_padre	SMALLINT,
  nombre	VARCHAR(10) NOT NULL
);
GO




-----------------------------------
--    CREAR LA TABLA HIJOS2    --
-----------------------------------
CREATE TABLE HIJOS2(
  id_hijo2	SMALLINT PRIMARY KEY,
  id_padre	SMALLINT,
  nombre	VARCHAR(10) NOT NULL
);
GO




-----------------------------------
--    CREAR LA TABLA NIETOS    --
-----------------------------------
CREATE TABLE NIETOS(
  id_nietos	SMALLINT PRIMARY KEY,
  id_hijo1	SMALLINT,
  id_hijo2	SMALLINT,
  nombre	VARCHAR(10) NOT NULL
);
GO




-------------------------------------------
--    CREAR FOREIGN KEY DE LAS TABLAS    --
-------------------------------------------
ALTER TABLE HIJOS1
ADD CONSTRAINT FK_HIJO1_PADRE FOREIGN KEY(id_padre)
REFERENCES PADRES(id_padre)
ON DELETE CASCADE;
GO


ALTER TABLE HIJOS2
ADD CONSTRAINT FK_HIJO2_PADRE FOREIGN KEY(id_padre)
REFERENCES PADRES(id_padre)
ON DELETE CASCADE;
GO


ALTER TABLE NIETOS
ADD CONSTRAINT FK_NIETOS_HIJOS1 FOREIGN KEY(id_hijo1)
REFERENCES HIJOS1(id_hijo1)
ON DELETE CASCADE;
GO


ALTER TABLE NIETOS
ADD CONSTRAINT FK_NIETOS_HIJOS2 FOREIGN KEY(id_hijo2)
REFERENCES HIJOS2(id_hijo2)
ON DELETE CASCADE;
GO




-------------------------------------------------------
--    ELIMINAR LAS RELACIONES FOREIGN KEY CREADAS    --
-------------------------------------------------------
ALTER TABLE HIJOS1 DROP CONSTRAINT FK_HIJO1_PADRE;
ALTER TABLE HIJOS2 DROP CONSTRAINT FK_HIJO2_PADRE;
ALTER TABLE NIETOS DROP CONSTRAINT FK_NIETOS_HIJOS1;
GO




-------------------------------------------------------
--    RE-CREAR LAS RELACIONES FOREIGN KEY CREADAS    --
-------------------------------------------------------
ALTER TABLE HIJOS1
ADD CONSTRAINT FK_HIJO1_PADRE FOREIGN KEY(id_padre)
REFERENCES PADRES(id_padre);
GO


ALTER TABLE HIJOS2
ADD CONSTRAINT FK_HIJO2_PADRE FOREIGN KEY(id_padre)
REFERENCES PADRES(id_padre);
GO


ALTER TABLE NIETOS
ADD CONSTRAINT FK_NIETOS_HIJOS1 FOREIGN KEY(id_hijo1)
REFERENCES HIJOS1(id_hijo1);
GO


ALTER TABLE NIETOS
ADD CONSTRAINT FK_NIETOS_HIJOS2 FOREIGN KEY(id_hijo2)
REFERENCES HIJOS2(id_hijo2);
GO




--------------------------------------------
--    CREAR TRIGGER EN LA TABLA PADRES    --
--------------------------------------------
CREATE OR ALTER TRIGGER tgr_eliminar_padres
   ON PADRES
   INSTEAD OF DELETE
AS 
BEGIN
 
 SET NOCOUNT ON;

 DELETE FROM HIJOS1 WHERE id_padre IN (SELECT id_padre FROM DELETED)
 DELETE FROM HIJOS2 WHERE id_padre IN (SELECT id_padre FROM DELETED)
 DELETE FROM PADRES WHERE id_padre IN (SELECT id_padre FROM DELETED)

END;
GO




--------------------------------------------
--    CREAR TRIGGER EN LA TABLA HIJOS1    --
--------------------------------------------
CREATE OR ALTER TRIGGER tgr_eliminar_hijos1
   ON HIJOS1
   INSTEAD OF DELETE
AS 
BEGIN

 SET NOCOUNT ON;

 DELETE FROM NIETOS WHERE id_hijo1 IN (SELECT id_hijo1 FROM DELETED)
 DELETE FROM HIJOS1 WHERE id_hijo1 IN (SELECT id_hijo1 FROM DELETED)

END;
GO




--------------------------------------------
--    CREAR TRIGGER EN LA TABLA HIJOS2    --
--------------------------------------------
CREATE OR ALTER TRIGGER tgr_eliminar_hijos2
   ON HIJOS2
   INSTEAD OF DELETE
AS 
BEGIN

 SET NOCOUNT ON;

 DELETE FROM NIETOS WHERE id_hijo2 IN (SELECT id_hijo2 FROM DELETED)
 DELETE FROM HIJOS2 WHERE id_hijo2 IN (SELECT id_hijo2 FROM DELETED)

END;
GO




---------------------------------------------------------------------------
--    INSERTAR REGISTROS A LAS TABLAS PADRES, HIJOS1, HIJOS2 Y NIETOS    --
---------------------------------------------------------------------------
INSERT INTO PADRES VALUES (1,'Padre');
INSERT INTO PADRES VALUES (2,'Padre');
INSERT INTO PADRES VALUES (3,'Padre');
INSERT INTO PADRES VALUES (4,'Padre');
INSERT INTO HIJOS1 VALUES (1,1,'test');
INSERT INTO HIJOS2 VALUES (10,2,'test');
INSERT INTO HIJOS1 VALUES (2,3,'test');
INSERT INTO HIJOS2 VALUES (11,4,'test');
INSERT INTO NIETOS VALUES (1,1,null,'test');
INSERT INTO NIETOS VALUES (2,null,10,'test');
INSERT INTO NIETOS VALUES (3,2,null,'test');
INSERT INTO NIETOS VALUES (4,null,11,'test');
GO




------------------------------------------------------------
--    CONSULTAR TABLAS PADRES, HIJOS1, HIJOS2 Y NIETOS    --
------------------------------------------------------------
SELECT * FROM PADRES;
SELECT * FROM HIJOS1;
SELECT * FROM HIJOS2;
SELECT * FROM NIETOS;
GO




-------------------------------------
--    ELIMINAR PADRE CON id = 1    --
-------------------------------------
DELETE FROM PADRES WHERE id_padre = 1;
GO




------------------------------------------------------------
--    CONSULTAR TABLAS PADRES, HIJOS1, HIJOS2 Y NIETOS    --
------------------------------------------------------------
SELECT * FROM PADRES;
SELECT * FROM HIJOS1;
SELECT * FROM HIJOS2;
SELECT * FROM NIETOS;
GO




-------------------------------------
--    ELIMINAR PADRE CON id = 2    --
-------------------------------------
DELETE FROM PADRES WHERE id_padre = 2;
GO




------------------------------------------------------------
--    CONSULTAR TABLAS PADRES, HIJOS1, HIJOS2 Y NIETOS    --
------------------------------------------------------------
SELECT * FROM PADRES;
SELECT * FROM HIJOS1;
SELECT * FROM HIJOS2;
SELECT * FROM NIETOS;
GO




---------------------------------
--    ELIMINAR LOS TRIGGERS    --
---------------------------------
DROP TRIGGER tgr_eliminar_padres;
DROP TRIGGER tgr_eliminar_hijos1;
DROP TRIGGER tgr_eliminar_hijos2;
GO




---------------------------------------------------------------
--    ELIMINAR LAS TABLAS NIETOS, HIJOS1, HIJOS1 Y PADRES    --
---------------------------------------------------------------
DROP TABLE NIETOS;
DROP TABLE HIJOS1;
DROP TABLE HIJOS2;
DROP TABLE PADRES;
GO