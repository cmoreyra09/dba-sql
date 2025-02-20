USE EmpresaX
GO

DROP TABLE Servicio.Contratos


CREATE TABLE Servicio.Contratos (
	
	idContrato			INT PRIMARY KEY,
	idCliente			INT FOREIGN KEY REFERENCES Persona.Clientes(idCliente)
						ON DELETE CASCADE
						ON UPDATE CASCADE,
	idDepartamentos		INT FOREIGN KEY REFERENCES Propiedad.Departamentos (idDepartamentos)
						ON DELETE CASCADE
						ON UPDATE CASCADE,
	fechaInicio			DATE,
	fechaFin			DATE,
	montoMensual		DECIMAL(7,2),
	condicion			VARCHAR(100)
)



CREATE TABLE Servicio.Contratos (
	
	idContrato			INT PRIMARY KEY,
	idCliente			INT,
	idDepartamentos		INT ,
	fechaInicio			DATE,
	fechaFin			DATE,
	montoMensual		DECIMAL(7,2),
	condicion			VARCHAR(100),

	FOREIGN KEY (idCliente) REFERENCES Persona.Clientes(idCliente)
						ON DELETE CASCADE
						ON UPDATE CASCADE,
	FOREIGN KEY (idDepartamentos) REFERENCES Propiedad.Departamentos (idDepartamentos)
						ON DELETE CASCADE
						ON UPDATE CASCADE

)
