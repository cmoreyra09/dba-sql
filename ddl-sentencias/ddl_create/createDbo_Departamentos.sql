

/*
	La columna idPropietario no se ha creado el foregin key porque se realizara con sentencias ddl con alter

*/

USE EmpresaX
GO



CREATE TABLE Propiedad.Departamentos (
	
	idDepartamentos			INT PRIMARY KEY NOT NULL ,
	idPropietario			INT ,
	direccion				VARCHAR(50),
	ciudad					VARCHAR(50),
	provincia				VARCHAR(50),
	codigoPostal			VARCHAR(50),
	numeroHabitacion		INT,
	numeroSanitario			INT,
	pagoMensual				DECIMAL(7,2)

)

-- Relizar la relacion foregin key
ALTER TABLE Propiedad.Departamentos 
ADD FOREIGN KEY(idPropietario) 
	REFERENCES Persona.Propietario(idPropietario)
	-- Acciones
	ON UPDATE CASCADE
	ON DELETE CASCADE


