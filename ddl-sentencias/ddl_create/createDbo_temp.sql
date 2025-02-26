






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
		