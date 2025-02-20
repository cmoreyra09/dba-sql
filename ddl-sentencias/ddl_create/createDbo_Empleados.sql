
-- (01) Tabla Persona.Empleados

/* Creando una tabla Persona.Empleados  */

CREATE TABLE Persona.Empleados(
	
	nombre		VARCHAR(100),
	apellido	VARCHAR(50),
	cargo		VARCHAR(50),
	telefono	VARCHAR(50),
	email		VARCHAR(50)

)
GO

/* Eliminando Columnas 

	Para eliminar una columna se tiene que usar la sentencia DDL ALTER TABLE	

*/

ALTER TABLE Persona.Empleados DROP COLUMN email 


/* Modificar tipo de datos de una columna 

	Para ello se coloca la siguiente instruccion

*/

ALTER TABLE Persona.Empleados ALTER COLUMN nombre VARCHAR(50) 


/*  Agregar Columnas Adicionales a Una tabla  */

ALTER TABLE Persona.Empleados ADD idEmpleado INT


/* Estableciendo un campo como primary Key */

ALTER TABLE Persona.Empleados ALTER COLUMN idEmpleado INT NOT NULL

ALTER TABLE Persona.Empleados ADD PRIMARY KEY (idEmpleado)




/* Establecer la IDENTITY a una campo 
	- Para este caso se realizara la eliminacion de una columna existente y se creara una nueva columna con la propiedad identity
*/

ALTER TABLE Persona.Empleados DROP COLUMN idEmpleado 

/* Eliminando restrinccion 
The object 'PK__Empleado__5295297C1EFD7B81' is dependent on column 'idEmpleado'.
*/

ALTER TABLE Persona.Empleados DROP CONSTRAINT PK__Empleado__5295297C1EFD7B81

/* Se restablece todo de nuevo Osea se le coloca primary key a los idEmpleados */

ALTER TABLE Persona.Empleados ADD idEmpleado INT IDENTITY(1,1) PRIMARY KEY NOT NULL
