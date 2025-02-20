
CREATE TABLE PROFESORES(


	dni				INT NOT NULL,
	nombre			VARCHAR(40),
	paterno			VARCHAR(40),
	materno			VARCHAR(40),
	email			VARCHAR(40),
	edad			INT

	PRIMARY KEY(dni)

)




CREATE TABLE CURSOS (

	cod_cur			INT NOT NULL,
	dni				INT NOT NULL FOREIGN KEY REFERENCES PROFESORES (dni)
					ON UPDATE CASCADE
					ON DELETE CASCADE
	,
	nombre			VARCHAR(40)

	PRIMARY KEY(cod_cur)


)


/*
	Concepto (Cascade) : 
		
		Si se actualiza algun valor, su correspondiente relacion foreing key tambien debe de actualizar su referencia.

*/

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
WHERE dni = '99999999'


------------------------------------------------
--	CONSULTAR LAS TABLAS PROFESORES Y CURSOS  --
------------------------------------------------
SELECT * FROM PROFESORES;

SELECT * FROM CURSOS;


----------------------------
--	ELIMINAR UN PROFESOR  --
----------------------------
DELETE FROM PROFESORES
WHERE dni = '77777777';


------------------------------------------------
--	CONSULTAR LAS TABLAS PROFESORES Y CURSOS  --
------------------------------------------------
SELECT * FROM PROFESORES;

SELECT * FROM CURSOS;