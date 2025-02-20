/*
Esquemas : 

Un esquema es un objeto de una base de datos que actua como contenedor. Los esquemas agrupan logicamente objetos relacionados en unico 
contenedor que los mantiene separados de otros objetos  de la base de datos en otros contenedores (esquemas).

SQL Predeterminados de SQL Server - Que se instalan por defecto 

Schema (dbo)

    Cuando se crea una tabla se crea por defecto con esqsuema dbo

    Los esquemas se encuentra en la carpeta seguridad del manangment de SQL server y se muestra los esquemas.


Schema (sys)

Schema (guest)

Schema (INFORMATION_SCHEMA)

*/

USE EmpresaX
GO

CREATE SCHEMA	Persona		
GO

CREATE SCHEMA	Servicio	
GO

CREATE SCHEMA   Propiedad	
GO
