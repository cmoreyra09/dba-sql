-- Para eliminar el usuario :

	/*
		
		Primero si el usuario se encuentra en sesion lo idea seria kilear la sesion ID
	
	*/

SELECT 
	session_id
FROM sys.dm_exec_sessions -- Es una vista del ambito del servidor que muestra informacion sobre todas las conneciones de usuarios activas y tareaas internas
	WHERE login_name = 'OTROS'
	
KILL 116


-- LUEGO
	DROP LOGIN OTROS