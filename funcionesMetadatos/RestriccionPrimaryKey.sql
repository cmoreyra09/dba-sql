	IF EXISTS(SELECT name FROM sys.tables WHERE name = 'Medicos')
		BEGIN
			DROP TABLE Medicos;
		END
	
		CREATE TABLE Medicos (

			idMedicamento		INT,
			nombre				VARCHAR(30),
			descripcion		    VARCHAR(30)
		)

		PRINT 'Tabla Creada..'


		ALTER TABLE Medicos ADD PRIMARY KEY (idMedicamento)
		GO
