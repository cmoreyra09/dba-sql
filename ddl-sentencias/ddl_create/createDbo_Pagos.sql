
/* Crear Tabla Pagos */


CREATE TABLE  Servicio.Pago (

		idPago						INT PRIMARY KEY NOT NULL,
		idContrato					INT,
		fechaPago					DATE,
		monto						DECIMAL(7,2),
		metodoPago					VARCHAR(50),

		FOREIGN KEY (idContrato) REFERENCES Servicio.Contratos (idContrato)
									ON UPDATE CASCADE
									ON DELETE CASCADE



)
