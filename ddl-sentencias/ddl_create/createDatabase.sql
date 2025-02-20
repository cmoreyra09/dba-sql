/* 

Creando Bases de Datos   

Cuando se Crea una base de datos.

Se crean 2 archivos MDF y LDF



bd_charge.MDF 
    
    - Contiene toda la informacion principal sobre la base de datos, en este archivo se encuentra :
        objetos de las tablas, fuciones , sp , vistas , etc.

bd_charge.ldf

    - Se encuentra los registros de transacciones, estos registros de transacciones ayudan al servidor a identificar actividades relacionadas
    con respecto al cambio, asi como identificar donde esta el error.


Se crear una base de datos utilizando una sentencia DDL


CREATE DATABASE bd_charge

*/


/*
	No es una buena practica que la base de datos se cree en la ruta por defecto , debido a que el sistema operativo podria fallar y podamos perder
	toda la informacion de la base de datos.
*/

/* Creando dbdatabase */

-- Configuracion Archivo mdf
-- Esta creacion de base de datos deberia de estar creada en un disk distinto 
CREATE DATABASE EmpresaX
ON(
			NAME				= EmpresaX_dat,
			FILENAME			= 'C:\disk_c\EmpresaX_dat.mdf',  -- Ruta donde se creara el archvio
			SIZE				= 10MB,
			MAXSIZE				= 50MB,
			FILEGROWTH			= 5MB   -- Esto hara creciendo en 5MB segun lo necesite, cuando este llegando al maxsize


)
LOG ON
(
-- Configuracion Archivo ldf
			NAME				= EmpresaX_log,
			FILENAME			= 'C:\disk_c\EmpresaX_log.ldf',  -- Ruta donde se creara el archvio
			SIZE				= 10MB,
			MAXSIZE				= 50MB,
			FILEGROWTH			= 5MB   -- Esto hara creciendo en 5MB segun lo necesite, cuando este llegando al maxsize
)
GO