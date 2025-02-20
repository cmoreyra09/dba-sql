-- Usar la Base de Datos EmpresaX
USE EmpresaX
GO


-- Insertar Registro en la Tabla Clientes
INSERT INTO Persona.Clientes(nombre, paterno, materno, telefono, email)
	VALUES('Juan', 'P�rez', 'L�pez', '555-1234', 'juan.perez@mail.com'),
		  ('Mar�a', 'G�mez', 'Mart�nez', '555-5678', 'maria.gomez@mail.com'),
		  ('Carlos', 'Ruiz', 'Fern�ndez', '555-9101', 'carlos.ruiz@mail.com'),
		  ('Ana', 'Torres', 'Garc�a', '555-1212', 'ana.torres@mail.com'),
		  ('Luis', 'Mart�nez', 'S�nchez', '555-1313', 'luis.martinez@mail.com'),
		  ('Marta', 'Hern�ndez', 'Vega', '555-1414', 'marta.hernandez@mail.com'),
		  ('Pedro', 'Jim�nez', 'Mu�oz', '555-1515', 'pedro.jimenez@mail.com'),
		  ('Laura', 'Castro', 'Morales', '555-1616', 'laura.castro@mail.com'),
		  ('Jorge', 'Fern�ndez', 'Herrera', '555-1717', 'jorge.fernandez@mail.com'),
		  ('Isabel', 'Reyes', 'D�az', '555-1818', 'isabel.reyes@mail.com'),
		  ('Antonio', 'Molina', 'Navarro', '555-1919', 'antonio.molina@mail.com'),
		  ('Rosa', 'Ram�rez', 'Cruz', '555-2020', 'rosa.ramirez@mail.com'),
		  ('Alberto', 'Ortega', 'Romero', '555-2121', 'alberto.ortega@mail.com'),
		  ('Elena', 'Gil', 'Castillo', '555-2222', 'elena.gil@mail.com'),
		  ('Manuel', 'M�ndez', 'R�os', '555-2323', 'manuel.mendez@mail.com')
GO


-- Insertar Registro en la Tabla Propietarios
INSERT INTO Persona.Propietarios(nombre, paterno, materno, direccion, telefono, email)
VALUES('Ana', 'L�pez', 'Garc�a', 'Calle Falsa 123', '555-1001', 'ana.lopez@mail.com'),
	  ('Pedro', 'Mart�nez', 'Rodr�guez', 'Av. Siempreviva 742', '555-1002', 'pedro.martinez@mail.com'),
	  ('Laura', 'Fern�ndez', 'S�nchez', 'Calle Real 456', '555-1003', 'laura.fernandez@mail.com'),
	  ('Roberto', 'Vargas', 'L�pez', 'Av. Principal 10', '555-1004', 'roberto.vargas@mail.com'),
	  ('Carmen', 'Ortiz', 'D�az', 'Calle Luna 25', '555-1005', 'carmen.ortiz@mail.com'),
	  ('Ricardo', 'Vega', 'Ram�rez', 'Calle Sol 58', '555-1006', 'ricardo.vega@mail.com'),
	  ('Patricia', 'Mu�oz', 'Castillo', 'Av. Libertad 105', '555-1007', 'patricia.munoz@mail.com'),
	  ('Javier', 'Morales', 'Herrera', 'Calle Paz 3', '555-1008', 'javier.morales@mail.com'),
	  ('Andrea', 'Herrera', 'R�os', 'Calle Amor 77', '555-1009', 'andrea.herrera@mail.com'),
	  ('Samuel', 'D�az', 'Navarro', 'Av. Reforma 22', '555-1010', 'samuel.diaz@mail.com'),
	  ('Cristina', 'Navarro', 'Cruz', 'Calle Verde 19', '555-1011', 'cristina.navarro@mail.com'),
	  ('Enrique', 'Cruz', 'Romero', 'Calle Azul 6', '555-1012', 'enrique.cruz@mail.com'),
	  ('Marta', 'Romero', 'Castillo', 'Av. Las Flores 123', '555-1013', 'marta.romero@mail.com'),
	  ('Fernando', 'Castillo', 'Morales', 'Calle Mar 99', '555-1014', 'fernando.castillo@mail.com'),
	  ('Gabriela', 'R�os', 'Fern�ndez', 'Av. Central 200', '555-1015', 'gabriela.rios@mail.com')
GO


-- Insertar Registro en la Tabla Empleados
INSERT INTO Persona.Empleados(nombre, apellido, cargo, telefono)
VALUES('Jos�', 'S�nchez Garc�a', 'Mantenimiento', '555-6789'),
	  ('Marta', 'Rodr�guez L�pez', 'Administraci�n', '555-9876'),
	  ('Luis', 'Garc�a Fern�ndez', 'Recepci�n', '555-6543'),
	  ('Ana', 'Torres S�nchez', 'Limpieza', '555-3210'),
	  ('Pedro', 'Mu�oz G�mez', 'Seguridad', '555-1234'),
	  ('Laura', 'G�mez Hern�ndez', 'Mantenimiento', '555-5678'),
	  ('Carlos', 'Hern�ndez Jim�nez', 'Administraci�n', '555-9101'),
	  ('Rosa', 'Vega Mart�nez', 'Recepci�n', '555-1112'),
	  ('Juan', 'Jim�nez Mu�oz', 'Limpieza', '555-1313'),
	  ('Elena', 'Morales Reyes', 'Seguridad', '555-1414'),
	  ('Antonio', 'Fern�ndez D�az', 'Mantenimiento', '555-1515'),
	  ('Isabel', 'Ram�rez Castillo', 'Administraci�n', '555-1616'),
	  ('Jorge', 'Castro R�os', 'Recepci�n', '555-1717'),
	  ('Alberto', 'Reyes Vargas', 'Limpieza', '555-1818'),
	  ('Marta', 'D�az Morales', 'Seguridad', '555-1919')
GO


-- Insertar Registro en la Tabla Departamentos
INSERT INTO Propiedad.Departamentos (idDepartamento ,idPropietario, direccion, ciudad, provincia, codigoPostal, numeroHabitacion, numeroSanitario, pagoMensual)
VALUES
(101, 1, 'Calle Falsa 123, Apt 1', 'Ciudad X', 'Provincia Y', '12345', 2, 1, 500),
(102, 2, 'Calle Falsa 123, Apt 2', 'Ciudad X', 'Provincia Y', '12345', 3, 2, 700),
(103, 3, 'Av. Siempreviva 742', 'Ciudad Z', 'Provincia W', '67890', 3, 2, 800),
(104, 4, 'Calle Real 456, Apt 3', 'Ciudad X', 'Provincia Y', '12345', 1, 1, 400),
(105, 5, 'Av. Principal 10, Apt 5', 'Ciudad X', 'Provincia Y', '12346', 2, 1, 600),
(106, 6, 'Calle Luna 25, Apt 6', 'Ciudad Y', 'Provincia Z', '12347', 1, 1, 450),
(107, 7, 'Calle Sol 58, Apt 7', 'Ciudad Z', 'Provincia W', '67891', 2, 2, 650),
(108, 8, 'Av. Libertad 105, Apt 8', 'Ciudad X', 'Provincia Y', '12348', 3, 2, 750),
(109, 9, 'Calle Paz 3, Apt 9', 'Ciudad Y', 'Provincia Z', '12349', 2, 1, 550),
(110, 10, 'Calle Amor 77, Apt 10', 'Ciudad X', 'Provincia Y', '12350', 1, 1, 400),
(111, 11, 'Av. Reforma 22, Apt 11', 'Ciudad Z', 'Provincia W', '67892', 3, 2, 900),
(112, 12, 'Calle Verde 19, Apt 12', 'Ciudad Y', 'Provincia Z', '12351', 2, 1, 600),
(113, 13, 'Calle Azul 6, Apt 13', 'Ciudad X', 'Provincia Y', '12352', 1, 1, 450),
(114, 14, 'Av. Las Flores 123, Apt 14', 'Ciudad X', 'Provincia Y', '12353', 2, 2, 650),
(115, 15, 'Calle Mar 99, Apt 15', 'Ciudad Z', 'Provincia W', '67893', 3, 2, 850),
(116, 1, 'Av. Central 200, Apt 16', 'Ciudad X', 'Provincia Y', '12354', 2, 1, 600),
(117, 2, 'Calle Falsa 123, Apt 17', 'Ciudad X', 'Provincia Y', '12345', 1, 1, 500),
(118, 3, 'Av. Siempreviva 742, Apt 18', 'Ciudad Z', 'Provincia W', '67890', 2, 1, 750),
(119, 4, 'Calle Real 456, Apt 19', 'Ciudad X', 'Provincia Y', '12345', 1, 1, 400),
(120, 5, 'Av. Principal 10, Apt 20', 'Ciudad X', 'Provincia Y', '12346', 3, 2, 800),
(121, 6, 'Calle Luna 25, Apt 21', 'Ciudad Y', 'Provincia Z', '12347', 2, 1, 600),
(122, 7, 'Calle Sol 58, Apt 22', 'Ciudad Z', 'Provincia W', '67891', 1, 1, 500),
(123, 8, 'Av. Libertad 105, Apt 23', 'Ciudad X', 'Provincia Y', '12348', 3, 2, 900),
(124, 9, 'Calle Paz 3, Apt 24', 'Ciudad Y', 'Provincia Z', '12349', 1, 1, 450),
(125, 10, 'Calle Amor 77, Apt 25', 'Ciudad X', 'Provincia Y', '12350', 2, 1, 600)
GO


-- Insertar Registro en la Tabla Contratos
INSERT INTO Servicio.Contratos (idContrato, idCliente, idDepartamento, fechaInicio, fechaFin, montoMensual, condicion)
VALUES
(11, 1, 101, '2024-01-01', '2024-12-31', 500, 'Pago mensual, sin mascotas'),
(12, 2, 102, '2024-02-01', '2024-11-30', 700, 'Pago mensual, sin mascotas'),
(13, 3, 103, '2024-03-01', '2025-02-28', 800, 'Pago mensual, permitido fumadores'),
(14, 4, 104, '2024-04-01', '2024-10-31', 400, 'Pago mensual, sin mascotas'),
(15, 5, 105, '2024-05-01', '2025-04-30', 600, 'Pago mensual, permitido mascotas peque�as'),
(16, 6, 106, '2024-06-01', '2025-05-31', 450, 'Pago mensual, sin mascotas'),
(17, 7, 107, '2024-07-01', '2024-12-31', 650, 'Pago mensual, permitido fumadores'),
(18, 8, 108, '2024-08-01', '2025-07-31', 750, 'Pago mensual, sin mascotas'),
(19, 9, 109, '2024-09-01', '2025-08-31', 550, 'Pago mensual, permitido mascotas peque�as'),
(20, 10, 110, '2024-10-01', '2025-09-30', 400, 'Pago mensual, sin mascotas'),
(21, 11, 111, '2024-11-01', '2025-10-31', 900, 'Pago mensual, permitido fumadores'),
(22, 12, 112, '2024-12-01', '2025-11-30', 600, 'Pago mensual, sin mascotas'),
(23, 13, 113, '2025-01-01', '2025-12-31', 450, 'Pago mensual, permitido mascotas peque�as'),
(24, 14, 114, '2025-02-01', '2026-01-31', 650, 'Pago mensual, sin mascotas'),
(25, 15, 115, '2025-03-01', '2026-02-28', 850, 'Pago mensual, permitido fumadores'),
(26, 1, 116, '2024-04-01', '2024-12-31', 600, 'Pago mensual, permitido mascotas peque�as'),
(27, 2, 117, '2024-05-01', '2025-04-30', 500, 'Pago mensual, sin mascotas'),
(28, 3, 118, '2024-06-01', '2025-05-31', 750, 'Pago mensual, permitido fumadores'),
(29, 4, 119, '2024-07-01', '2024-12-31', 400, 'Pago mensual, sin mascotas'),
(30, 5, 120, '2024-08-01', '2025-07-31', 800, 'Pago mensual, permitido mascotas peque�as')
GO


-- Insertar Registro en la Tabla Mantenimientos
INSERT INTO Servicio.Mantenimientos(idMantenimiento ,idDepartamento, idEmpleado, fecha, descripcion, costo)
VALUES
(11, 101, 1, '2024-01-15', 'Reparaci�n de fuga en el ba�o', 100),
(12, 102, 2, '2024-01-20', 'Revisi�n el�ctrica', 150),
(13, 103, 3, '2024-02-05', 'Pintura de paredes', 200),
(14, 104, 4, '2024-02-15', 'Reparaci�n de cerradura', 50),
(15, 105, 5, '2024-03-10', 'Limpieza de alfombras', 80),
(16, 106, 6, '2024-03-20', 'Reparaci�n de aire acondicionado', 300),
(17, 107, 7, '2024-04-01', 'Revisi�n de plomer�a', 120),
(18, 108, 8, '2024-04-10', 'Cambio de ventanas', 250),
(19, 109, 9, '2024-05-05', 'Reparaci�n de calefacci�n', 200),
(20, 110, 10, '2024-05-15', 'Reemplazo de azulejos', 150),
(21, 111, 11, '2024-06-01', 'Reparaci�n de techo', 400),
(22, 112, 12, '2024-06-10', 'Limpieza de conductos de aire', 100),
(23, 113, 13, '2024-07-05', 'Reparaci�n de enchufes', 70),
(24, 114, 14, '2024-07-15', 'Mantenimiento de jard�n', 50),
(25, 115, 15, '2024-08-01', 'Revisi�n de tuber�as', 120),
(26, 116, 1, '2024-08-10', 'Pintura exterior', 300),
(27, 117, 2, '2024-09-05', 'Reparaci�n de escaleras', 180),
(28, 118, 3, '2024-09-15', 'Limpieza de ventanas', 60),
(29, 119, 4, '2024-10-01', 'Reparaci�n de filtraciones', 220),
(30, 120, 5, '2024-10-10', 'Mantenimiento de ascensor', 500)
GO


-- Insertar Registro en la Tabla Pagos
INSERT INTO Servicio.Pagos (idPago ,idContrato, fechaPago, monto, metodoPago)
VALUES
-- Pagos para el idContrato 11
(1, 11, '2024-01-01', 500, 'Transferencia bancaria'),
(2, 11, '2024-02-01', 500, 'Transferencia bancaria'),
(3, 11, '2024-03-01', 500, 'Transferencia bancaria'),
(4, 11, '2024-04-01', 500, 'Transferencia bancaria'),
(5, 11, '2024-05-01', 500, 'Transferencia bancaria'),
(6, 11, '2024-06-01', 500, 'Transferencia bancaria'),
(7, 11, '2024-07-01', 500, 'Transferencia bancaria'),
(8, 11, '2024-08-01', 500, 'Transferencia bancaria'),
(9, 11, '2024-09-01', 500, 'Transferencia bancaria'),
(10, 11, '2024-10-01', 500, 'Transferencia bancaria'),
(11, 11, '2024-11-01', 500, 'Transferencia bancaria'),
(12, 11, '2024-12-01', 500, 'Transferencia bancaria'),
-- Pagos para el idContrato 12
(13, 12, '2024-02-01', 700, 'Tarjeta de cr�dito'),
(14, 12, '2024-03-01', 700, 'Tarjeta de cr�dito'),
(15, 12, '2024-04-01', 700, 'Tarjeta de cr�dito'),
(16, 12, '2024-05-01', 700, 'Tarjeta de cr�dito'),
(17, 12, '2024-06-01', 700, 'Tarjeta de cr�dito'),
(18, 12, '2024-07-01', 700, 'Tarjeta de cr�dito'),
(19, 12, '2024-08-01', 700, 'Tarjeta de cr�dito'),
(20, 12, '2024-09-01', 700, 'Tarjeta de cr�dito'),
(21, 12, '2024-10-01', 700, 'Tarjeta de cr�dito'),
(22, 12, '2024-11-01', 700, 'Tarjeta de cr�dito'),
-- Pagos para el idContrato 13
(23, 13, '2024-03-01', 800, 'Efectivo'),
(24, 13, '2024-04-01', 800, 'Efectivo'),
(25, 13, '2024-05-01', 800, 'Efectivo'),
(26, 13, '2024-06-01', 800, 'Efectivo'),
(27, 13, '2024-07-01', 800, 'Efectivo'),
(28, 13, '2024-08-01', 800, 'Efectivo'),
(29, 13, '2024-09-01', 800, 'Efectivo'),
(30, 13, '2024-10-01', 800, 'Efectivo'),
(31, 13, '2024-11-01', 800, 'Efectivo'),
(32, 13, '2024-12-01', 800, 'Efectivo'),
(33, 13, '2025-01-01', 800, 'Efectivo'),
(34, 13, '2025-02-01', 800, 'Efectivo'),
-- Pagos para el idContrato 14
(35, 14, '2024-04-01', 400, 'Transferencia bancaria'),
(36, 14, '2024-05-01', 400, 'Transferencia bancaria'),
(37, 14, '2024-06-01', 400, 'Transferencia bancaria'),
(38, 14, '2024-07-01', 400, 'Transferencia bancaria'),
(39, 14, '2024-08-01', 400, 'Transferencia bancaria'),
(40, 14, '2024-09-01', 400, 'Transferencia bancaria'),
(41, 14, '2024-10-01', 400, 'Transferencia bancaria'),
-- Pagos para el idContrato 15
(42, 15, '2024-05-01', 600, 'Tarjeta de cr�dito'),
(43, 15, '2024-06-01', 600, 'Tarjeta de cr�dito'),
(44, 15, '2024-07-01', 600, 'Tarjeta de cr�dito'),
(45, 15, '2024-08-01', 600, 'Tarjeta de cr�dito'),
(46, 15, '2024-09-01', 600, 'Tarjeta de cr�dito'),
(47, 15, '2024-10-01', 600, 'Tarjeta de cr�dito'),
(48, 15, '2024-11-01', 600, 'Tarjeta de cr�dito'),
(49, 15, '2024-12-01', 600, 'Tarjeta de cr�dito'),
(50, 15, '2025-01-01', 600, 'Tarjeta de cr�dito'),
(51, 15, '2025-02-01', 600, 'Tarjeta de cr�dito'),
(52, 15, '2025-03-01', 600, 'Tarjeta de cr�dito'),
(53, 15, '2025-04-01', 600, 'Tarjeta de cr�dito'),
-- Pagos para el idContrato 16
(54, 16, '2024-06-01', 450, 'Efectivo'),
(55, 16, '2024-07-01', 450, 'Efectivo'),
(56, 16, '2024-08-01', 450, 'Efectivo'),
(57, 16, '2024-09-01', 450, 'Efectivo'),
(58, 16, '2024-10-01', 450, 'Efectivo'),
(59, 16, '2024-11-01', 450, 'Efectivo'),
(60, 16, '2024-12-01', 450, 'Efectivo'),
(61, 16, '2025-01-01', 450, 'Efectivo'),
(62, 16, '2025-02-01', 450, 'Efectivo'),
(63, 16, '2025-03-01', 450, 'Efectivo'),
(64, 16, '2025-04-01', 450, 'Efectivo'),
(65, 16, '2025-05-01', 450, 'Efectivo'),
-- Pagos para el idContrato 17
(66, 17, '2024-07-01', 650, 'Transferencia bancaria'),
(67, 17, '2024-08-01', 650, 'Transferencia bancaria'),
(68, 17, '2024-09-01', 650, 'Transferencia bancaria'),
(69, 17, '2024-10-01', 650, 'Transferencia bancaria'),
(70, 17, '2024-11-01', 650, 'Transferencia bancaria'),
(71, 17, '2024-12-01', 650, 'Transferencia bancaria'),
-- Pagos para el idContrato 18
(72, 18, '2024-08-01', 750, 'Tarjeta de cr�dito'),
(73, 18, '2024-09-01', 750, 'Tarjeta de cr�dito'),
(74, 18, '2024-10-01', 750, 'Tarjeta de cr�dito'),
(75, 18, '2024-11-01', 750, 'Tarjeta de cr�dito'),
(76, 18, '2024-12-01', 750, 'Tarjeta de cr�dito'),
(77, 18, '2025-01-01', 750, 'Tarjeta de cr�dito'),
(78, 18, '2025-02-01', 750, 'Tarjeta de cr�dito'),
(79, 18, '2025-03-01', 750, 'Tarjeta de cr�dito'),
(80, 18, '2025-04-01', 750, 'Tarjeta de cr�dito'),
(81, 18, '2025-05-01', 750, 'Tarjeta de cr�dito'),
(82, 18, '2025-06-01', 750, 'Tarjeta de cr�dito'),
(83, 18, '2025-07-01', 750, 'Tarjeta de cr�dito'),
-- Pagos para el idContrato 19
(84, 19, '2024-09-01', 550, 'Efectivo'),
(85, 19, '2024-10-01', 550, 'Efectivo'),
(86, 19, '2024-11-01', 550, 'Efectivo'),
(87, 19, '2024-12-01', 550, 'Efectivo'),
(88, 19, '2025-01-01', 550, 'Efectivo'),
(89, 19, '2025-02-01', 550, 'Efectivo'),
(90, 19, '2025-03-01', 550, 'Efectivo'),
(91, 19, '2025-04-01', 550, 'Efectivo'),
(92, 19, '2025-05-01', 550, 'Efectivo'),
(93, 19, '2025-06-01', 550, 'Efectivo'),
(94, 19, '2025-07-01', 550, 'Efectivo'),
(95, 19, '2025-08-01', 550, 'Efectivo'),
-- Pagos para el idContrato 20
(96, 20, '2024-10-01', 400, 'Transferencia bancaria'),
(97, 20, '2024-11-01', 400, 'Transferencia bancaria'),
(98, 20, '2024-12-01', 400, 'Transferencia bancaria'),
(99, 20, '2025-01-01', 400, 'Transferencia bancaria'),
(100, 20, '2025-02-01', 400, 'Transferencia bancaria'),
(101, 20, '2025-03-01', 400, 'Transferencia bancaria'),
(102, 20, '2025-04-01', 400, 'Transferencia bancaria'),
(103, 20, '2025-05-01', 400, 'Transferencia bancaria'),
(104, 20, '2025-06-01', 400, 'Transferencia bancaria'),
(105, 20, '2025-07-01', 400, 'Transferencia bancaria'),
(106, 20, '2025-08-01', 400, 'Transferencia bancaria'),
(107, 20, '2025-09-01', 400, 'Transferencia bancaria')
GO


-- Usar la Base de Datos EmpresaX
USE EmpresaX
GO


-- Consultar la Tabla Empleados y Mantenimientos
SELECT * FROM Persona.Empleados
GO

SELECT * FROM Servicio.Mantenimientos
GO


-- Actualizar el valor del idEmpleado 1 a 100
UPDATE Persona.Empleados
SET idEmpleado = 100
WHERE idEmpleado = 1
GO


-- Consultar la Tabla Empleados y Mantenimientos
SELECT * FROM Persona.Empleados
GO

SELECT * FROM Servicio.Mantenimientos
GO


-- Habilitar para poder insertar valor en el campo IDENTITY
SET IDENTITY_INSERT Persona.Empleados ON
GO


-- Volver a actualizar el valor del idEmpleado 1 a 100
UPDATE Persona.Empleados
SET idEmpleado = 100
WHERE idEmpleado = 1
GO


-- Consultar la Tabla Empleados y Mantenimientos
SELECT * FROM Persona.Empleados
GO

SELECT * FROM Servicio.Mantenimientos
GO


-- Deshabilitar para insertar valor en el campo IDENTITY
SET IDENTITY_INSERT Persona.Empleados OFF
GO


-- Consultar la Tabla Departamentos, Contratos y Mantenimientos
SELECT * FROM Propiedad.Departamentos
GO

SELECT * FROM Servicio.Contratos
GO

SELECT * FROM Servicio.Mantenimientos
GO


-- Actualizar el valor del idDepartamento 101 a 1001
UPDATE Propiedad.Departamentos
SET idDepartamentos = 1001
WHERE idDepartamentos = 101
GO


-- Volver a consultar la Tabla Departamentos, Mantenimientos, Contratos y Pagos
SELECT * FROM Propiedad.Departamentos
GO

SELECT * FROM Servicio.Mantenimientos
GO

SELECT * FROM Servicio.Contratos
GO

SELECT * FROM Servicio.Pago
GO


-- Eliminar el valor del idDepartamento 1001
DELETE FROM Propiedad.Departamentos
WHERE idDepartamentos = 1001
GO


-- Volver a consultar la Tabla Departamentos, Mantenimientos, Contratos y Pagos
SELECT * FROM Propiedad.Departamentos
GO

SELECT * FROM Servicio.Mantenimientos
GO

SELECT * FROM Servicio.Contratos
GO

SELECT * FROM Servicio.Pago
GO


-- Consultar la Tabla Propietarios, Departamentos, Contratos, Mantenimientos y Pagos
SELECT * FROM Persona.Propietarios
WHERE idPropietario = 10
GO

SELECT * FROM Propiedad.Departamentos
WHERE idPropietario = 10
GO

SELECT * FROM Servicio.Mantenimientos
WHERE idDepartamento = 110
GO

SELECT * FROM Servicio.Contratos
WHERE idDepartamento = 110
GO

SELECT * FROM Servicio.Pagos
WHERE idContrato = 20
GO


-- Eliminar el valor del idPropietario 10 de la Tabla Propietarios
DELETE FROM Persona.Propietarios
WHERE idPropietario = 10
GO


/*
Volver a consultar la Tabla Propietarios, Departamentos, 
Contratos, Mantenimientos y Pagos
*/
SELECT * FROM Persona.Propietarios
WHERE idPropietario = 10
GO

SELECT * FROM Propiedad.Departamentos
WHERE idPropietario = 10
GO

SELECT * FROM Servicio.Mantenimientos
WHERE idDepartamento = 110
GO

SELECT * FROM Servicio.Contratos
WHERE idDepartamento = 110
GO

SELECT * FROM Servicio.Pagos
WHERE idContrato = 20
GO


/* SOLO SE UTILIZA CASCADE CUANDO UPDATE */

/*
	Cuando se trata de eliminacion en cascada no se utiliza on delete cascade, en caso especifico si se usa cascade update no action




*/