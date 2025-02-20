/* La sentencia Truncate :
	
	es un comando del lenguaj de definicion de datos DDL la cual elimina todas las filas de una tabla
	SQL server almacena datos de una tabla en las paginas y el comando TRUNCATE elimina filas desasignados en la pagina.
	
	Al utilizar la sentencia truncate no se puede revertir los datos eliminados ya que no se registra el registro durante la ejecuicion de esta operacion.

	La ejecucion de este comando bloquea las paginas en lugar de las filas, por lo tanto , requiere menos bloqueos y recursos.

	No se puede truncar una tabla la que se hace referencua una clave externa

	Si trunca una tabla se restablecera los contadores de cualquier columna identity

	Antes de poder truncar una tabla debe tener los privilegios necesarios, como alter table

	TRUNCAR una tabla es una forma rapida de borrar registros de una tabla si no necesita preocuparse por revertirla.

	Una recomendacion, si no estas seguro de eliminar todos los registros de la tabla , se aconseja que se haga un respaldo de la base de datos antes de eliminar los datos.

*/




-- (1) TRUNCATE vs (2) DELETE 

--(1)
-- Es un comando DDL.
-- El comando TRUNCATE elimina todas las filas de una tabla. No podemos usar una clausula Where en esto.
-- El comando TRUNCATE coloca bloqueo de tabla y pagina para eliminar todos los registros.
-- El comando TRUNCATE no registra entrada para cada fila eliminada en el registro de transacciones.
-- Es mas rapido que el comando DELETE.

--(2)
-- Es un comando DML.
-- El comando DELETE es util para eliminar todas o filas especificas de una tabla especificada mediante una clausula Where
-- El comando DELETE coloca un bloqueo en cada fila que requiere eliminarse de una tabla.
-- El comando DELETE registra una entrada por cada fila eliminada en el registro de transacciones.
-- El comando DELETE es mas lento que el comando TRUNCATE.


-- Usar la Base de Datos EmpresaX
USE EmpresaX
GO

-- Truncar la Tabla Clientes
TRUNCATE TABLE Persona.Clientes
GO


-- Truncar la Tabla Contratos
TRUNCATE TABLE Servicio.Contratos
GO


-- Truncar la Tabla Departamentos
TRUNCATE TABLE Propiedad.Departamentos
GO


-- Truncar la Tabla Propietarios
TRUNCATE TABLE Persona.Propietarios
GO


-- Truncar la Tabla Empleados
TRUNCATE TABLE Persona.Empleados
GO



-- Truncar la Tabla Pagos
TRUNCATE TABLE Servicio.Pagos
GO


-- Truncar la Tabla Mantenimientos
TRUNCATE TABLE Servicio.Mantenimientos
GO


-- Consultar las Tablas Pagos y Mantenimientos
SELECT * FROM Servicio.Pagos
GO

SELECT * FROM Servicio.Mantenimientos
GO



-- Consultar la Tabla Clientes
SELECT * FROM Persona.Clientes
GO


-- Verificar que la Propiedad IDENTITY
-- de la Tabla Clientes
sp_help 'Persona.Clientes'
GO


-- Eliminar la Restricci�n Foreign Key
ALTER TABLE Servicio.Contratos
DROP CONSTRAINT [nombre_restricci�n]
GO


-- Volver a consultar la Tabla Clientes
SELECT * FROM Persona.Clientes
GO


-- Eliminar todos los registros mediante DELETE
DELETE FROM Persona.Clientes
GO


-- Volver a consultar la Tabla Clientes
SELECT * FROM Persona.Clientes
GO


-- Insertar un registro a la Tabla Clientes
INSERT INTO Persona.Clientes(nombre, paterno, materno, telefono, email)
					  VALUES('Ana', 'Paz', 'Torres', '555-3030', 'ana@mail.com')
GO


-- Volver a consultar la Tabla Clientes
SELECT * FROM Persona.Clientes
GO


-- TRUNCAR la Tabla Clientes
TRUNCATE TABLE Persona.Clientes
GO

-- Volver a consultar la Tabla Clientes
SELECT * FROM Persona.Clientes
GO


-- Insertar un registro a la Tabla Clientes
INSERT INTO Persona.Clientes(nombre, paterno, materno, telefono, email)
					  VALUES('Ana', 'Paz', 'Torres', '555-3030', 'ana@mail.com')
GO


-- Volver a consultar la Tabla Clientes
SELECT * FROM Persona.Clientes
GO