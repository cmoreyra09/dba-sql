--  (4) Explicacion Foreing Key


/*

	Una foreign Key (Clave Foranea) es una restriccion que se utiliza para asegurar la integridad referencial entre dos tablas. Es un campo ( o conjunto de campos ) en una tabla que se referencia a la primary key (clave primaria) en otra tabla.
	La clave foranea garantiza que los valores en una columna o conjunto de columna coincidan con los valores en clave primaria de la tabla relacionada, de manera que se mantenga la coherencia de los datos en la base de datos.

	On Update  & On delete :

	Las clausulas adminitidas que se pueden realizar al eliminar o actualizar los valores de la tabla PRINCIPAL incluyen :
	
	NO ACTION	: 

		Cuando las clausulas on update o on delete se establecen en no action, la operacion de actualizacion o eliminacion realizada en la tabla principal fallara 
		como un error.

		Esta son las clausulas por defecto si no se establece las clausulas on update o on delete dentro de las instrucciones.

	CASCADE	    : 

		Al establecer las cluasulas on update o on delete en CASCADE, la misma accion realizada en los valores referenciados de la tabla principal se reflejara 
		en los valores relacionados en la tabla secundaria por ejemplo, si el valor al que se hace referencia se elimina en la tabla principal. Tambien se eliminan
		todas las filas relacionadas en la tabla secundaria.

	SET NULL    :

		Con esta opcion de clausulas On update y on Delete, si los valores a los que se hace referencia en la tabla principal se eliminan o modifican, todo los valores
		relacionados en la tabla secundaria, se establecen en valor NULL.

	SET DEFAULT :
	
		El uso de la opcion SET DEFAULT	 de las clausulas on update y on delete especifica que si , los valores a lo que se hace referencia en la tabla principal, se 
		actualizan o eliminan, los valores relacionados en la tabla secundaria con columna foreign key se estableceran en su valor predeterminado.

*/



-- Foreing Key ( Predeterminado ) 

--USE tempdb
--GO



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
	dni				INT NOT NULL FOREIGN KEY REFERENCES PROFESORES (dni),
	nombre			VARCHAR(40)

	PRIMARY KEY(cod_cur)


)
 
-- INSERTAR REGISTRO A LA TABLA PRINCIPAL PROFESORES

INSERT INTO PROFESORES VALUES 
	(72400273,'Carlos','Moreyra','Noel','cwmoreyran@gmail.com',25),
	(72400272,'Karla','Moreyra','Noel','cwmoreyran@gmail.com',25),
	(72400274,'Karle','Moreyra','Noel','cwmoreyran@gmail.com',25)

-- INSERTAR 4 REGISTROS A LA TABLA SECUNDARIA DE CURSOS

INSERT INTO CURSOS VALUES 
	(1,72400273,'Carlos'),
	(2,72400272,'Carlos'),
	(3,72400274,'Carlos')



SELECt * FROM CURSOS
SELECt * FROM PROFESORES



/* El error conciste porque el dni no existe en la tabla principal  */
INSERT INTO CURSOS VALUES (4,72400276,'Carlos')

















