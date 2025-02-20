----------------------------------------
--	UTILIZAR LA BASE DE DATOS tempdb --
----------------------------------------
USE tempdb;

 /*
 
	Descripcion : 

	Lo que realizar el set null es que se enfoca en la relacion y ya sera para la opcion de update o delete realiza una conversion de su objeto relacional
	trasnforma a null dejando como cambio la tabla principal y la dim estaria como NULL.
 
 */
--------------------------------------------
--	ELIMINAR LA TABLA CURSOS Y PROFESORES --
--------------------------------------------
DROP TABLE CURSOS;

DROP TABLE PROFESORES;


---------------------------------
--	CREAR LA TABLA PROFESORES  --
---------------------------------
CREATE TABLE PROFESORES
(
   dni 		INT PRIMARY KEY ,
   nombre 	VARCHAR(40),
   paterno 	VARCHAR(20),
   materno 	VARCHAR(20),
   email 	VARCHAR(40),
   edad 	INT
);


-----------------------------
--	CREAR LA TABLA CURSOS  --
-----------------------------
CREATE TABLE CURSOS
(
	cod_cur	INT PRIMARY KEY ,
	dni 	INT FOREIGN KEY REFERENCES PROFESORES(dni)
			ON UPDATE SET NULL
			ON DELETE SET NULL,
	nombre 	VARCHAR(40)  NOT NULL
);


----------------------------------------------
--	INSERTAR VALORES A LA TABLA PROFESORES  --
----------------------------------------------
INSERT INTO PROFESORES VALUES(99999999, 'FERNANDA', 'TORRES', 'GUILLEN', 'f.torres@example.com', 25);
INSERT INTO PROFESORES VALUES(88888888, 'LUISA', 'PEREZ', 'GARCIA', 'l.perez@example.com', NULL);
INSERT INTO PROFESORES VALUES(77777777, 'FATIMA', 'TORRES', 'GALLEGOS', 'f.torresg@example.com', 30);


------------------------------------------
--	INSERTAR VALORES A LA TABLA CURSOS  --
------------------------------------------
INSERT INTO CURSOS VALUES(1, 99999999, 'REDES');
INSERT INTO CURSOS VALUES(2, 99999999, 'ALGEBRA');
INSERT INTO CURSOS VALUES(3, 88888888, 'PROGRAMACI�N');
INSERT INTO CURSOS VALUES(4, 77777777, 'SQL SERVER');


------------------------------------------------
--	CONSULTAR LAS TABLAS PROFESORES Y CURSOS  --
------------------------------------------------
SELECT * FROM PROFESORES;

SELECT * FROM CURSOS;


----------------------------------------
--	ACTUALIZAR EL DNI DE UN PROFESOR  --
----------------------------------------
UPDATE PROFESORES
SET dni = '22222222'
WHERE dni = '99999999';


------------------------------------------------
--	CONSULTAR LAS TABLAS PROFESORES Y CURSOS  --
------------------------------------------------
SELECT * FROM PROFESORES;

SELECT * FROM CURSOS;


----------------------------
--	ELIMINAR UN PROFESOR  --
----------------------------
DELETE FROM PROFESORES
WHERE dni = '77777777'


------------------------------------------------
--	CONSULTAR LAS TABLAS PROFESORES Y CURSOS  --
------------------------------------------------
SELECT * FROM PROFESORES;

SELECT * FROM CURSOS;