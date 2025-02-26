/*

    Restricciones :


        Son reglas y restricciones predefinidas que se aplican en una sola columna o en varias columnas, relacionadas
        a los valores permitidos en las columnas, para manteneder la integridad, precision y confiabilidad de los datos de esa columan.



*/

 -- SI CUMPLE


-- Si los datos insertados cumplmen con la regla de restriccion, se insertaran con exito.




 -- SI NO CUMPLE

-- Si los datos insertados violan la restriccion definida, la operacion de insercion se cancelara.

/*

    Las restricciones se pueden considerar a nivel de columna, donde se especifica como parte de la definicion de
    columna y se aplicaran solo a esa columna.

*/



-- Existen 6 tipos de Restricciones que podemos utilizar las cuales son : 

/*
    (1) NOT NULL
    (2) UNIQUE
    (3) PRIMARY KEY
    (4) FOREIGN KEY
	(5) CHECK CONSTRAINT
	(6) DEFAULT CONSTRAINT




*/

/* Ejemplo de Restriccion NOT NULL */



BEGIN TRANSACTION 

		DECLARE @option		AS TINYINT  SET @option		= 2; -- Si escoge opcion 2 se muestra la restriccion de la tabla correspondiente que no acepta NULL
		DECLARE @contador   AS INT		SET @contador	= 1;
		
		DECLARE @profesores AS TABLE(

			dni				INT				NOT NULL,
			nombre			VARCHAR(30)		NOT NULL,
			paterno			VARCHAR(30)		NOT NULL,
			materno			VARCHAR(30)		NOT NULL,
			email			VARCHAR(30)		NOT NULL,
			edad			TINYINT			NULL      

		);

		

		IF @option = 1
			BEGIN

				WHILE @contador < 5
					BEGIN

					INSERT INTO @profesores
						VALUES (@contador*8,CONCAT('Estudiante',@contador),CONCAT('Apellido',@contador),CONCAT('Materno',@contador),CONCAT('Correo',@contador),@contador*10)

					SET @contador = @contador + 1 ;

			
					END

					SELECT * FROM @profesores
			END
		IF @option = 2
			BEGIN
				
				INSERT INTO @profesores
				VALUES (1231231,'Estudiante2','Apellido','correo',12)

				SELECT * FROM @profesores

			END

				ELSE PRINT 'Opcion Invalida..'

COMMIT TRANSACTION
GO





/*

    (1) NOT NULL

        Por defecto, las columnas pueden conteneder valores NULL. Se usa una restriccion NOT NULL para evitar insertar
        valores NULL en la columna especificada, considerandolo entonces como un valor no aceptado para esa columna.
        Esto significa que debe proporcionar un valor valido n NULO, ya que la columna siempre contendra datos.

*/ 




/* Ejemplo de Restriccion NOT NULL */



BEGIN TRANSACTION 

		DECLARE @option		AS TINYINT  SET @option		= 2; -- Si escoge opcion 2 se muestra la restriccion de la tabla correspondiente que no acepta NULL
		DECLARE @contador   AS INT		SET @contador	= 1;
		
		DECLARE @profesores AS TABLE(

			dni				INT				NOT NULL,
			nombre			VARCHAR(30)		NOT NULL,
			paterno			VARCHAR(30)		NOT NULL,
			materno			VARCHAR(30)		NOT NULL,
			email			VARCHAR(30)		NOT NULL,
			edad			TINYINT			NULL      

		);

		

		IF @option = 1
			BEGIN

				WHILE @contador < 5
					BEGIN

					INSERT INTO @profesores
						VALUES (@contador*8,CONCAT('Estudiante',@contador),CONCAT('Apellido',@contador),CONCAT('Materno',@contador),CONCAT('Correo',@contador),@contador*10)

					SET @contador = @contador + 1 ;

			
					END

					SELECT * FROM @profesores
			END
		IF @option = 2
			BEGIN
				
				INSERT INTO @profesores
				VALUES (1231231,'Estudiante2','Apellido','correo',12)

				SELECT * FROM @profesores

			END

				ELSE PRINT 'Opcion Invalida..'

COMMIT TRANSACTION
GO

/*

    (2) UNIQUE

    La restriccion UNIQUE se utiliza para garantiza que no se inserten valores duplicados en una columna especifica o combinacion de columnas que participen en la restriccion unique

    y no formen parte de la clave primaria


*/


		DECLARE @profesores AS TABLE(

			dni				INT				NOT NULL,
			nombre			VARCHAR(30)		NOT NULL,
			paterno			VARCHAR(30)		NOT NULL,
			materno			VARCHAR(30)		NOT NULL,
			email			VARCHAR(30)		UNIQUE NOT NULL, -- Solo va aceptar valores que no se duplique si se identifica otro registro con el mismo valor esto dara error de insercion.
			edad			TINYINT			NULL      

		);

/*

    (3) PRIMARY KEY

    La restriccion PRIMARY KEY consta de una columna o varias columnas con valores que identifican de forma unica cada fila de la tabla 


    Las restriccion PRIMARY KEY , combina restricciones UNIQUE y NOT NULL, donde la columna o el conjunto de columnas que participan en primary KEY no pueden aceptar
    el valor NULL. Si la primary KEY (CLAVE PRIMARIA ) Se define en varias columnas, entonces se puede insertar valores duplicados en cada columna individualmente
    , pero es importante mencionar que los valores de combinacion de todas las columnas de PRIMARY KEY (CLAVE PRIMARIA) deben ser unicos.



    Ademas de proporcionar un acceso rapido a los datos de la tabla, se crea automaticamente un indice al defini la clave primaria.

    Si no se coloca el DNI esto dara error ya que al ser una restriccion de primary key no acepta valores nulos

*/



		DECLARE @profesores AS TABLE(

			dni				INT				PRIMARY KEY NOT NULL,
			nombre			VARCHAR(30)		NOT NULL,
			paterno			VARCHAR(30)		NOT NULL,
			materno			VARCHAR(30)		NOT NULL,
			email			VARCHAR(30)		UNIQUE NOT NULL, -- Solo va aceptar valores que no se duplique si se identifica otro registro con el mismo valor esto dara error de insercion.
			edad			TINYINT			NULL      

		);




/*

    (4) FOREIGN KEY


    Una lave externa o foranea es una clave de base de datos que se utiliza para vincular dos tablas. La restriccion FOREIGN KEY se utiliza para vincular dos tablas.
    La restriccion FOREIGN KEY identifica las relaciones entre las tablas de la base de datos haciendo referencia a una columna, o conjunto de columnas en la tabla HIJA
    que contiene la clave externa, a la columna PRIMARY KEY o conjunto de columnas en la tabla PADRE O FACT


*/




		IF OBJECT_ID('dbo.Profesores') IS NOT NULL 
			DROP TABLE Profesores;
	
	
		CREATE TABLE Profesores (

			dni				INT PRIMARY KEY		NOT NULL,
			nombre			VARCHAR(30)			NOT NULL,
			paterno			VARCHAR(30)			NOT NULL,
			materno			VARCHAR(30)			NOT NULL,
			email			VARCHAR(30)			NOT NULL,
			edad			TINYINT				NULL      

		);
			
			DROP TABLE Profesores;
		-- Dropear Profesores (2)


		IF OBJECT_ID('dbo.Cursos') IS NOT NULL 
			DROP TABLE Cursos;
			
			CREATE TABLE Cursos (
		
				cod_cur			SMALLINT PRIMARY KEY IDENTITY(1,1) NOT NULL ,
				dni				INT,
				nombre			VARCHAR(30)
		
			
				FOREIGN KEY(dni) REFERENCES Profesores (dni)
		
			)

			DROP TABLE Cursos;

		-- Dropear Cursos (1)
		

/*

	
	(5) CHECK CONSTRAINT

	Un check Constraint se define en una columna o conjunto de columnas para limitar el rango de valores que se pueden insertar en estas columnas utilizando una condicion predefinida


	La condicion de restriccion CHECK utiliza los diferentes operadores de comparacion, como AND, OR, BETWEEN, IN, LIKE e IS NULL para escribir su expresion BOOLEANA 
	que devolvera VERDADERO, FALSO o desconocido.



*/


		DECLARE @profesores AS TABLE(

			dni				INT	PRIMARY KEY NOT NULL CHECK(dni BETWEEN  1  AND  2000),
			nombre			VARCHAR(30)		NOT NULL,
			paterno			VARCHAR(30)		NOT NULL,
			materno			VARCHAR(30)		NOT NULL,
			email			VARCHAR(30)		UNIQUE NOT NULL, -- Solo va aceptar valores que no se duplique si se identifica otro registro con el mismo valor esto dara error de insercion.
			edad			TINYINT			NULL      

		);



		INSERT INTO @profesores
			VALUES ( 1123 ,'Dario','Testing','Doc','testing@gmail.com',12 )



/*

	(6) DEFAULT CONSTRAINT


	Se utiliza un DEFAULT constraint(restriccion DEFAULT) para proporcionar un valor de oclumna predeterminado para las filas insertadas si no se especifica ningun valor 
	para esa columna en la instruccion INSERT.


	La restriccion Predeterminada ayuda a mantener la integridad de dominio al proporcionar valores adecuados para la columna, en caso de que el usuario no proporcion un valor
	para ella. El valor predeterminado puede ser un valor constante, un valor de funcion del sistema o NULL.

*/





		DECLARE @profesores AS TABLE(

			dni				INT	PRIMARY KEY		NOT NULL CHECK(dni BETWEEN  1  AND  2000),
			nombre			VARCHAR(30)			NOT NULL,
			paterno			VARCHAR(30)			NOT NULL,
			materno			VARCHAR(30)			NOT NULL,
			email			VARCHAR(30)			UNIQUE NOT NULL, -- Solo va aceptar valores que no se duplique si se identifica otro registro con el mismo valor esto dara error de insercion.
			edad			TINYINT				NULL,
			fechaIngreso	SMALLDATETIME		NULL DEFAULT GETDATE()

		);



		INSERT INTO @profesores( dni, nombre, paterno, materno, email, edad )
			VALUES (1 ,'Dario','Testing','Doc','testing@gmail.com',12)


		SELECT * FROM @profesores





/*

	Resumen : 


		Esta son las restricciones para garantizar la integridad de los datos y definir las relaciones entre tablas. 
		La aplicacion adecuada de restricciones es esencial para  mantener la consistencia y calidad de los datos en una base de datos.



*/