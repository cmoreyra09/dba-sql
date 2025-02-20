/* Crear tabla Servicio.Mantenimiento  */

CREATE TABLE Servicio.Mantenimientos (

		idMantenimiento				INT PRIMARY KEY  NOT NULL,
		idDepartamentos				INT NOT NULL,
		idEmpleado					INT NOT NULL,
		fecha						DATE,
		descripcion					VARCHAR(100),
		costo						DECIMAL(7,2)


	FOREIGN KEY (idDepartamentos) REFERENCES Propiedad.Departamentos (idDepartamentos)
									ON UPDATE CASCADE
									ON DELETE CASCADE,

	FOREIGN KEY (idEmpleado)	  REFERENCES Persona.Empleados (idEmpleado)
									ON UPDATE CASCADE
									ON DELETE CASCADE


)
