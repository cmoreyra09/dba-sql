--------------------------------------------
--    Usar la Base de Datos HospitalABC    --
--------------------------------------------
USE HospitalABC
GO



/********************************************
	TABLA Medicos - Restricci�n NOT NULL
*********************************************/
--Insertar un M�dico sin ning�n error
INSERT INTO Medicos (nombre, apellido, especialidad, telefono, email)
			 VALUES ('Carlos', 'Martinez', 'Cardiolog�a', '999999999', 'carlos.ma@example.com');


--Restricci�n NOT NULL - Columna "apellido"
INSERT INTO Medicos (nombre, apellido, especialidad, telefono, email)
			 VALUES ('Ana', NULL, 'Pediatr�a', '999990000', 'ana.lopez@example.com');


--Corregir Restricci�n NOT NULL - Columna "apellido"
INSERT INTO Medicos (nombre, apellido, especialidad, telefono, email)
			 VALUES ('Ana', 'Lopez', 'Pediatr�a', '999990000', 'ana.lopez@example.com');


--Consultar la Tabla Medicos
SELECT * FROM Medicos;







/********************************************
	TABLA Pacientes - Restricci�n UNIQUE
*********************************************/
--Insertar un Paciente sin ning�n error
INSERT INTO Pacientes (nombre, apellido, edad, genero, direccion, telefono, email)
				VALUES('Juan', 'Perez', 30, 'M', 'Calle Argentina 123', '999998888', 'juan.p@example.com');


--Restricci�n UNIQUE - Columna "email"
INSERT INTO Pacientes (nombre, apellido, edad, genero, direccion, telefono, email)
				VALUES('Juan', 'Pirlo', 22, 'M', 'Calle Brazil 123', '999997777', 'juan.p@example.com');


--Corregir Restricci�n UNIQUE - Columna "email"
INSERT INTO Pacientes (nombre, apellido, edad, genero, direccion, telefono, email)
				VALUES('Juan', 'Pirlo', 22, 'M', 'Calle Brazil 123', '999997777', 'juan.pirlo@example.com');


--Consultar la Tabla Pacientes
SELECT * FROM Pacientes;







/****************************************************
	TABLA Medicamentos - Restricci�n PRIMARY KEY
*****************************************************/
--Insertar un Medicamento sin ning�n error
 INSERT INTO Medicamentos (idMedicamento, nombre, descripcion)
					VALUES(1, 'Paracetamol', 'Analg�sico y antipir�tico');


--Restricci�n PRIMARY KEY - Columna "idMedicamento"
 INSERT INTO Medicamentos (idMedicamento, nombre, descripcion)
					VALUES(1, 'Amoxicilina', 'Antibi�tico');


--Restricci�n PRIMARY KEY - Columna "idMedicamento" como NULL
 INSERT INTO Medicamentos (idMedicamento, nombre, descripcion)
					VALUES(NULL, 'Amoxicilina', 'Antibi�tico');


--Corregir Restricci�n PRIMARY KEY - Columna "idMedicamento"
 INSERT INTO Medicamentos (idMedicamento, nombre, descripcion)
					VALUES(2, 'Amoxicilina', 'Antibi�tico'),
						  (3, 'Ibuprofeno', 'Antiinflamatorio no esteroideo'),
						  (4, 'Aspirina', 'Analg�sico y antiinflamatorio'),
						  (5, 'Clonazepam', 'Benzodiacepina'),
						  (6, 'Metformina', 'Antidiab�tico');


--Consultar la Tabla Medicamentos
SELECT * FROM Medicamentos;







/****************************************************
	TABLA Pacientes - Restricci�n CHECK
*****************************************************/
--Insertar un Pacientes sin ning�n error
INSERT INTO Pacientes (nombre, apellido, edad, genero, direccion, telefono, email)
VALUES('Elena', 'Ruiz', 37, 'F', 'Avenida Nebulosa 147', '999996666', 'elena.r@example.com');


--Restricci�n CHECK - Columna "email"
--		No termina con un punto al final
INSERT INTO Pacientes (nombre, apellido, edad, genero, direccion, telefono, email)
VALUES('Sara', 'Ortiz', 28, 'F', 'Avenida Estrella 369', '999995555', 'sara.o@examplecom');


--		No contiene un @ en el correo
INSERT INTO Pacientes (nombre, apellido, edad, genero, direccion, telefono, email)
VALUES('Sara', 'Ortiz', 28, 'F', 'Avenida Estrella 369', '999995555', 'sara.oexample.com');


--Corregir Restricci�n CHECK - Columna "email"
INSERT INTO Pacientes (nombre, apellido, edad, genero, direccion, telefono, email)
VALUES('Sara', 'Ortiz', 28, 'F', 'Avenida Estrella 369', '999995555', 'sara.o@example.com');


--Restricci�n CHECK - Columna "edad"
--		valor fuera del rango
INSERT INTO Pacientes (nombre, apellido, edad, genero, direccion, telefono, email)
VALUES('David', 'Morales', 142, 'M', 'Calle Planeta 258', '999994444', 'david.mo@example.com');


--Corregir Restricci�n CHECK - Columna "edad"
INSERT INTO Pacientes (nombre, apellido, edad, genero, direccion, telefono, email)
VALUES('David', 'Morales', 42, 'M', 'Calle Planeta 258', '999994444', 'david.mo@example.com');


--Consultar la Tabla Medicamentos
SELECT * FROM Pacientes;







/****************************************************
	TABLA Citas - Restricci�n FOREIGN KEY
*****************************************************/
--Consultar las Tabas Medicos y Pacientes
SELECT * FROM Medicos;
SELECT * FROM Pacientes;
GO


--Insertar una Cita sin ning�n error
INSERT INTO Citas (idMedico, idPaciente, fechaHora, motivo)
			VALUES(1, 1, '2024-09-01 09:00', 'Dolor de rodilla');


--Restricci�n FOREIGN KEY - Columna "idPaciente"
--		El idPaciente no puede tener un valor NULL
INSERT INTO Citas (idMedico, idPaciente, fechaHora, motivo)
			VALUES(3, NULL, '2024-09-10 09:00', 'Consulta pedi�trica');


--		El idPaciente no existe en la Tabla Paciente
INSERT INTO Citas (idMedico, idPaciente, fechaHora, motivo)
			VALUES(3, 100, '2024-09-10 09:00', 'Consulta pedi�trica');


--Corregir Restricci�n FOREIGN KEY - Columna "idPaciente"
INSERT INTO Citas (idMedico, idPaciente, fechaHora, motivo)
			VALUES(3, 3, '2024-09-10 09:00', 'Consulta pedi�trica');


--Consultar las Tablas Medicos, Pacientes y Medicamentos
SELECT * FROM Medicos;
SELECT * FROM Pacientes;
SELECT * FROM Citas;
GO







/****************************************************
	TABLA HistorialesMedicos - Restricci�n DEFAULT
*****************************************************/
--Consultar las Tabas Medicos y Pacientes
SELECT * FROM Medicos;
SELECT * FROM Pacientes;
GO


--Insertar un HistorialesMedicos sin ning�n error
--		La columna fecha se Insertar por Defecto
INSERT INTO HistorialesMedicos (idMedico, idPaciente, diagnostico, tratamiento)
			VALUES(1, 1, 'Tendinitis', 'Fisioterapia');


--		Insertar un valor manual en La columna fecha
INSERT INTO HistorialesMedicos (idMedico, idPaciente, fecha, diagnostico, tratamiento)
			VALUES(3, 3, '2024-09-10 08:55', 'Resfriado com�n', 'Reposo y l�quidos');



--Consultar las Tablas Medicos, Pacientes e HistorialesMedicos
SELECT * FROM Medicos;
SELECT * FROM Pacientes;
SELECT * FROM HistorialesMedicos;
GO







/****************************************************
	TABLA Prescripciones
*****************************************************/
--Insertar Prescripciones sin ning�n error
INSERT INTO Prescripciones(idHistorial, idMedicamento, dosis, duracion)
					VALUES(1, 1,'850 mg', '60 d�as'),
						  (2, 6,'500 mg', '5 d�as');


--Consultar las Tablas Pacientes, HistorialesMedicos, Prescripciones y Medicamentos
SELECT * FROM Pacientes;
SELECT * FROM HistorialesMedicos;
SELECT * FROM Prescripciones;
SELECT * FROM Medicamentos;
GO