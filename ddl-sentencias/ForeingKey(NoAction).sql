-- FOREIGN KEY ( NO ACTION )

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
					ON UPDATE NO ACTION
					ON DELETE NO ACTION
	,
	nombre			VARCHAR(40)

	PRIMARY KEY(cod_cur)


)


INSERT INTO PROFESORES VALUES 
	(72400273,'Carlos','Moreyra','Noel','cwmoreyran@gmail.com',25),
	(72400272,'Karla','Moreyra','Noel','cwmoreyran@gmail.com',25),
	(72400274,'Karle','Moreyra','Noel','cwmoreyran@gmail.com',25)

-- INSERTAR 4 REGISTROS A LA TABLA SECUNDARIA DE CURSOS

INSERT INTO CURSOS VALUES 
	(1,72400273,'Carlos'),
	(2,72400272,'Carlos'),
	(3,72400274,'Carlos')




SELECT * FROM CURSOS
SELECT * FROM PROFESORES

-- INSERTAMOS UN VALOR A LA TABLA CURSOS QUE NO ESTA RELACIONADA CON LA TABLA PRINCIPAL
INSERT INTO CURSOS VALUES (5,5555555,'CLOUD COMPÚTING')
-- Resultado : La tabla principal no cuenta con un profesor con ese dni para que se pueda hacer una relacion

-- Actualizar un DNI de un profesor 
UPDATE PROFESORES SET dni = 72400212 WHERE dni = 72400273 
-- Resultado : No va a poder establecer una relacion relacional por ello que dara error.


-- Eliminar un profesor
DELETE FROM PROFESORES WHERE dni = 72400273
-- Resultado : Dara un error, ya que no puede eliminar el profesor porque no mantiene la integridad que mantiene esta relacion.



-- Eliminar Cursos
DELETE FROM CURSOS WHERE cod_cur = 3
-- Resultado : Esto si eliminara los registros de cursos y luego se puede eliminara en la tabla principal 