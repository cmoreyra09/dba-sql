/*


    Roles a nivel de servidor :

        SQL Server proporciona roles a nivel de servidor para ayudarlo a administrar los permisos en un servidor. Estos
		roles son entidades de seguridad que agrupan a otras entidades. Los roles a nivel de servidor abarcan todo el servidor en cuanto su alcance de permisos.


	Roles : 

		sysadmin :

			Es el rol con mayores privilegios en SQL Server
			Los miembros de rol sysadmin tiene control total sobre la instancia de SQL server. Pueden realizar cualquier operacion en el servidor, incluyendo la administracion
			de bases de datos configuracion del servidor y seguridad


		serveradmin :
			
			Los mienbros de este rol pueden configurar las opcioones del servidor y realizar tareas administrativas relacionadas con el servidor como cambiar las opciones de configuracion globales
			del servidor.

			Tambien pueden iniciar detener el servidor de SQL server


		setupAdmin :
			
			Los miembros del rol setupadmin pueden administrar los enlaces de servidores remotos y configurar opciones del servidor.

			Este rol tiene permisos para agregar y eliminar servidores vinculados , que permiten la ejecucion de consultas distribuidas entre servidores SQL.


		securityadmin :
			
			Los miembros de este rol pueden administrar la seguridad a nivel de servidor :
	
				Pueden crear modificar y eliminar logins.

			Tambien pueden otorgar y revocar permisos a nivel de servidor y establecer permisos para los usuarios en las bases de datos.

		proccesadmin :
			
			Los miembros de roll processadmin pueden administrar los procesos que se ejecutan en sql server, lo que incluye la capacidad de ver y terminar procesos o conexiones activas.

			Pueden detener cualquier tarea que este bloqueando otros procesos o consumiendo demasiado recursos.


		dbcreator :
			
			Los miembros de este rol pueden crear , modificar, eliminar y restaurar bases de datos en la instancia de SQL server

			Tienen privilegios para realizar tareas relacionadas con la creacion y administracion de bases de datos, pero no necesariamente pueden administrar la seguridad de los usuarios de la bases de datos.

		bulkadmin :
			
			Los miembros de rol bulkadmin tiene permisos para ejecutar operaciones de importacion masiva de datos
				bulk insert en SQL server.

			Este rol es util cuando se necesitan insertar grandes cantidades de datos en tablas de SQL Server mediante el comando BULK INSERT

		diskadmin :
			
			El rol diskadmin en SQL server es responsable de las administraciones de los discos fisicos en los que se almacenan los archivos de base de datos
			los miembros de este rol pueden realizar tareas relacionadas con la gestion de los archivos del disco que utiliza SQL Server, como agregar, qutiar o modificar unidades de disco
			para almacenamiento.

		public :

			El rol public es un rol especial y esta disponible para todos los usuarios de SQL server de manera predeterminada. Todos los logins que acceden a SQL server automaticamente son miembros del roll public.


			El rol public no se puede eliminar ni quitar de ningun login o usuario su funcion es proporcionar un conjunto basico de permisos que todo los usuarios tienen por defecto.



		Sintaxis Roles a nivel de servidor :

			
			USE MASTER;

				ALTER SERVER ROLE 'SERVIDOR'

				ADD MEMBER LOGIN

				DROP MEMBER LOGIN 
*/


--  Permisos a nivel de servidor 
SELECT *
FROM sys.fn_builtin_permissions('SERVER')
ORDER BY permission_name;


