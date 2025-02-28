USE master
GO


/*
	LOGIN : 

	En SQL Server, un Login es una credencial de acceso que permite a un usuario autenticarse en la instacia
	del servidor de bases de datos. Es el primer paso para establecer una conexion con SQL server,
	y una vez que un usuario se autentica con su login , puede acceder a las bases de datos dentro de esa instancia
	,siempre que tambien tenga permisos otorgados a nivel de bases de datos.

	Sintaxis :


		CREATE LOGIN ''
			WITH PASSOWRD = ''
			
		MUST_CHANCGE, -- sql server solicita una contraseña nueva la primera vez que se use en el inicio de sesion.
		DEFAULT_DATABASE = 'database' -- Especifica la base de datos preterminada al inicio de sesion si no se incluye la predterminada es master
		DEFAULT_LANGUAGE = language , -- Si no se especifica se pone el predeterminado del servidor
		CHECK_EXPIRATION = ON , OFF , -- Especifica si debe aplicar las directivas de caducidad de contraseña de ese inicio de sesion (ON)
		CHECK_POLICY = ON ,OFF -- La cual especifica que deben aplicacrse la contraseña de windows en el equipo en el que se ejecuta sql server para el inicio de sesion 
			valor predetemrinado ON , 
	
		DROP LOGIN '' ;



*/



USE master
GO


/* Create Login Master */

CREATE LOGIN OTROS
WITH PASSWORD = N'1234' MUST_CHANGE,
     DEFAULT_DATABASE = master,
     CHECK_EXPIRATION = ON,
     CHECK_POLICY = ON;
GO


 -- Cuando es AD (Active Directory - Window Server)
CREATE LOGIN [Testing\carlos]
FROM WINDOWS
WITH DEFAULT_DATABASE = master;
GO