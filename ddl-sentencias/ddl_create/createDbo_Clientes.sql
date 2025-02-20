
-- (02) Tabla Persona.Clientes


-- SENTENCIA DDL


-- Formas de crear una tabla

-- Primera Forma
CREATE TABLE Persona.Clientes (

	idCliente		INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	nombre			VARCHAR(50) NULL,
	paterno			VARCHAR(50) NULL ,
	materno			VARCHAR(50) NULL ,
	telefono		VARCHAR(50) NULL ,
	email			VARCHAR(50) NULL

)

-- Segunda Forma
CREATE TABLE Persona.Clientes (

	idCliente		INT IDENTITY (1,1) NOT NULL,
	nombre			VARCHAR(50) NULL,
	paterno			VARCHAR(50) NULL ,
	materno			VARCHAR(50) NULL ,
	telefono		VARCHAR(50) NULL ,
	email			VARCHAR(50) NULL

	PRIMARY KEY (idCliente)

)

-- (3) Creacion tabla Propietarios


CREATE TABLE Persona.Propietario (
	
	idPropietario			INT IDENTITY(1,1),
	nombre					VARCHAR(50),
	paterno					VARCHAR(50),
	materno					VARCHAR(50),
	direccion				VARCHAR(50),
	telefono				VARCHAR(50),
	email					VARCHAR(50)

	PRIMARY KEY(idPropietario)


)
