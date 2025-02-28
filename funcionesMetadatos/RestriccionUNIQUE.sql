	
    
    
    IF EXISTS(SELECT name FROM sys.tables WHERE name = 'Pacientes')
		BEGIN
			DROP TABLE Pacientes;
		END
	
		CREATE TABLE Pacientes (

			idPaciente		INT PRIMARY KEY,
			nombres			VARCHAR(30),
			apellido		VARCHAR(30),
			edad			TINYINT,
			genero			CHAR(1),
			direccion		VARCHAR(100),
			telefono		CHAR(9), -- Unique
			email			VARCHAR(50) -- Unique

		)

		PRINT 'Tabla Creada..'

		ALTER TABLE Pacientes ADD UNIQUE (telefono)
		GO

		ALTER TABLE Pacientes ADD UNIQUE (email)
		GO
