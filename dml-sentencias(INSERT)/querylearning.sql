 -- Descripcion Insert 

/*

Insert Registro - Transact SQL
Deshabilitar La propiedad Identity
Insertar Multiples  Registros - Transact SQL
Insertar Registro a una tabla Con foreing Key
Insertar Registro a una tabla con primary key Compuesta


*/


/* 
	
	Insertar Registro con lenguaje Transact SQL 

	Tipos de datos (Basico) :

	Numericos Exactos :
		- int      = 13
		- decimal  = 13 p 13.5
		- bit	   = 1  o 0

	Fecha y Hora	  :

		- time     = '13:10:20.123'
		- date     = '01-01-2024'
		- datetime = '01-01-2024 13:10:20.123'

	Cadenas de caracteres  :
	
	    - Char(n)    = 'Texto'
		- VARCHAR(N) = 'Texto'
		
    Valor NULL :

		- Representan la ausencia de un registro en el campo correspondiente.

*/



-- Insertar Datos a una tabla ( INSERT TRANSACT SQL )


DECLARE @Clientes TABLE (

	Id				INT PRIMARY KEY NOT NULL ,
	nombreCliente	NVARCHAR(20),
	telefonoCelular INT

)


INSERT INTO @Clientes VALUES (1,'Charlie','989898982')

SELECT * FROM @Clientes GO;



-- Deshabilitar la Propiedad Identity Para luego Insertar Manualmente ( INSERT TRANSACT SQL )

/*

			IF OBJECT_ID('dbo.TestingIdentity', 'U') IS NOT NULL

			- OBJECT_ID = devuelve el identificador único del objeto si existe.
			- 'U'       = indica que estamos buscando un objeto de tipo tabla.
            - DROP TABLE dbo.TestingIdentity; Si la tabla existe, la elimina.
            - CREATE TABLE dbo.TestingIdentity (...)
			- Se vuelve a crear la tabla con los campos Id y Telefono.

*/


IF OBJECT_ID('dbo.testingDbo','U') IS NOT NULL 
	DROP TABLE dbo.testingDbo;

CREATE TABLE dbo.testingDbo (

	Id				INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Telefono        INT
	
);


SET IDENTITY_INSERT testingDbo ON; -- ON Para que se pueda agregar valores manualmente / OFF Para que se puedan agregar valores por defecto 

INSERT INTO testingDbo (Id, Telefono ) VALUES (1,23123) -- Se debe de especificar las columnas 

SELECT * FROM testingDbo




-- Insertar Multiples Registros (INSERT TRANSACT SQL )

DECLARE @idEstudiantes TABLE (

	IdEstudiante     INT PRIMARY KEY,
	nombreEstudiante NVARCHAR(30)
)

INSERT INTO @idEstudiantes VALUES 
									(1,'Carlos'),
									(2,'Carlo' ),
									(3,'Nelson')

SELECT * FROM @idEstudiantes



INSERT INTO practice.Colegiatura (monto, fecha, estado)
				VALUES   (400, '01-01-2024', 1),
						 (400, '01-02-2024', 1),
						 (400, '01-03-2024', 1),
						 (400, '01-04-2024', 1),
						 (400, '01-05-2024', 1),
						 (400, '01-06-2024', 1),
						 (400, '01-07-2024', 1),
						 (400, '01-08-2024', 1),
						 (400, '01-09-2024', 1),
						 (400, '01-10-2024', 1),
						 (400, '01-11-2024', 1),
						 (400, '01-12-2024', 1);



-- Insertar Registro Relacion Foreing Key










