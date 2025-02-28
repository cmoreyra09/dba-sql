/*

	Validacion de Tabla


	La validacion de tablas en SQL Server Implica comprobar que las tablas exista.

	Utilizando la Funcion de Metadato Llamado OBJECT_ID, la cual nos va devolver el numero de identificacion del objeto de base de datos de un objeto
	con alcance de esquema.



	(1) -- Opcion

	SELECT OBJECT_ID('object_type')

	(2) -- 

	La segunda forma es consultar la vista del sistema llamado 'sys.tables' la cual contiene informacion de todas las tablas de la base de Datos  en donde
	estamos ubicados.

	SELECT * FROM sys.tables


*/


-- Testing Dropping Table


BEGIN TRANSACTION

	IF OBJECT_ID('tempdb..#Testing') IS NOT NULL
		BEGIN
			DROP TABLE #Testing
		END

	CREATE TABLE #Testing (
	
		id		TINYINT				NOT NULL,
		nobmre	varchar(40)			NOT NULL 
	
	)


	IF EXISTS (SELECT * FROM SYS.tables WHERE name = 'Testing')
		BEGIN
			DROP TABLE Testing
		END

	CREATE TABLE Testing (
	
	id		TINYINT				NOT NULL,
	nobmre	varchar(40)			NOT NULL 
	
	)

	DECLARE @opcion AS TINYINT SET @opcion = 1;


	IF @opcion = 1
		BEGIN

			IF OBJECT_ID('tempdb..#Testing') IS NOT NULL
				BEGIN
					DROP TABLE #Testing
				END

			PRINT 'Se elimino la tabla temoporal'


		END

	IF @opcion = 2

		IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Testing')
			BEGIN
				DROP TABLE Testing;
			END
		

COMMIT TRANSACTION
GO