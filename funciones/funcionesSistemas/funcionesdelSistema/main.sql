/*

    HOST_ID :

        Devuelve el numero de identificacion de la estacion de trabajo que es el identificado de proceso (PID)
        de la aplicacion en el equipo cliente que se esta conectando a SQL server.

    HOST_NAME :

        Devuelve el nombre de la estacion de trabajo
        
    IS_NULL :

        Esta funcion sustituye el valor NULL por el valo especificado.

    ERROR_LINE :

        Devuelve el numero de linea en que se produjo un error que provoco la ejecucion del bloque CATCH de una contruccion TRY.. CATCHA

    ERROR_MESSAGE:

        Devuelve el texto del mensaje del error que provoc la ejecucion del bloque catch de una construccion TRY .. CATCH

    ERROR_NUMBER:

        Devuelve el numero de error que provoco la ejecucion del bloque CATCH de una construccion TRY .. CATCH


    ERROR_PROCEDURE :

        Devuelve el nombre del procedimiento almacenado o desencadenador donde se produce un error , si ese provoco que se ejecutara en bloque CATCH
        de una construccion TRY .. CATCH.


    ERROR_SEVERITY :
 
    en SQL Server devuelve la gravedad del error, lo cual es útil para clasificar la importancia del problema y decidir si se debe registrar, manejar automáticamente o alertar a un administrador. Los errores en SQL Server tienen niveles de severidad de 0 a 25, donde:

    0-10: Mensajes informativos o advertencias.
    11-16: Errores generados por el usuario, como violaciones de restricciones.
    17-19: Errores más serios que requieren intervención manual.
    20-25: Errores fatales que pueden hacer que la conexión se cierre.


    ERROR_STATE :

        Devuelve el numero de estado del error que provoco la ejecucion del bloque catch de una construccion TRY .. CATCH.


    TRY .. CATCH :

        El uso de TRY...CATCH en SQL Server es fundamental para manejo de errores en consultas, 
        transacciones y procedimientos almacenados. Aquí te mostraré ejemplos de uso en la vida real y cómo optimizar tus consultas con TRY...CATCH.


*/



-- HOST_ID / HOST_NAME 

SELECT HOST_ID(),HOST_NAME()


-- IS_NULL



/*

    Consultar las columnas ProductID, Name y color de tabla "Production.Product" donde el valor de la columna color sea NULL reeplazar por green

*/


SELECT 

	ISNULL(Color,'Green')

	FROM Production.Product
	


-- ERROR_LINE(): / ERROR_MESSAGE():


/* Devuelve NULL porque solo debe de devolver con una instruccion catch */
SELECT ERROR_LINE() AS ErroLine



BEGIN TRANSACTION 
BEGIN TRY
    -- Creando una tabla temporal para prueba
    CREATE TABLE #Clientes (
        ID INT PRIMARY KEY,
        Nombre NVARCHAR(50)
    );

    -- Primera inserción correcta
    INSERT INTO #Clientes (ID, Nombre) VALUES (1, 'Perry');

    -- Esta segunda inserción fallará porque ID es clave primaria y no puede haber duplicados
    INSERT INTO #Clientes (ID, Nombre) VALUES (1, 'Lulu');

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    PRINT 'Ocurrió un error en la línea: ' + CAST(ERROR_LINE() AS NVARCHAR);
    PRINT 'Mensaje de error: ' + ERROR_MESSAGE();
    
    -- Deshacer la transacción en caso de error
    ROLLBACK TRANSACTION;
END CATCH
GO



-- ERROR_NUMBER() / ERRO_LINE()


BEGIN TRANSACTION 

BEGIN TRY
    -- Crear una tabla temporal
    CREATE TABLE #Productos (
        ID INT PRIMARY KEY,
        Nombre NVARCHAR(50)
    );

    -- Insertar un registro correctamente
    INSERT INTO #Productos (ID, Nombre) VALUES (1, 'Laptop');

    -- Esta inserción fallará porque ID ya existe (violación de clave primaria)
    INSERT INTO #Productos (ID, Nombre) VALUES (1, 'Tablet');

    -- Si todo sale bien, confirmamos la transacción
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    PRINT 'Número de error: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
    PRINT 'Línea del error: ' + CAST(ERROR_LINE() AS NVARCHAR);
    PRINT 'Mensaje de error: ' + ERROR_MESSAGE();
    
    -- Deshacer la transacción en caso de error
    ROLLBACK TRANSACTION;
END CATCH
GO


-- ERROR_PROCEDURE()

-- Creamos un procedimiento almacenado que causará un error
CREATE PROCEDURE InsertarProducto
AS
BEGIN
    BEGIN TRANSACTION 

    BEGIN TRY
        -- Crear una tabla temporal dentro del procedimiento
        CREATE TABLE #Productos (
            ID INT PRIMARY KEY,
            Nombre NVARCHAR(50)
        );

        -- Insertar un registro correctamente
        INSERT INTO #Productos (ID, Nombre) VALUES (1, 'Celular');

        -- Este INSERT fallará porque el ID ya existe
        INSERT INTO #Productos (ID, Nombre) VALUES (1, 'Tablet');

        -- Si todo es correcto, confirmamos la transacción
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        PRINT 'Número de error: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Línea del error: ' + CAST(ERROR_LINE() AS NVARCHAR);
        PRINT 'Procedimiento donde ocurrió el error: ' + ISNULL(ERROR_PROCEDURE(), 'N/A');
        PRINT 'Mensaje de error: ' + ERROR_MESSAGE();
        
        -- Deshacer la transacción en caso de error
        ROLLBACK TRANSACTION;
    END CATCH
END;
GO

-- Ejecutamos el procedimiento para probarlo
EXEC InsertarProducto;
GO



-- ERROR_SEVERITY

BEGIN TRY
    -- Crear una tabla temporal
    CREATE TABLE #Usuarios (
        ID INT PRIMARY KEY,
        Nombre NVARCHAR(50)
    );

    -- Insertar un registro válido
    INSERT INTO #Usuarios (ID, Nombre) VALUES (1, 'Perry');

    -- Intentar insertar un ID duplicado (esto generará un error)
    INSERT INTO #Usuarios (ID, Nombre) VALUES (1, 'Lulu');
END TRY
BEGIN CATCH
    PRINT 'Número de error: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
    PRINT 'Gravedad del error: ' + CAST(ERROR_SEVERITY() AS NVARCHAR);
    PRINT 'Línea del error: ' + CAST(ERROR_LINE() AS NVARCHAR);
    PRINT 'Mensaje de error: ' + ERROR_MESSAGE();
END CATCH;
GO



-- ERROR_STATE()


BEGIN TRY
    -- Crear tablas de prueba
    CREATE TABLE #Clientes (
        ID INT PRIMARY KEY,
        Nombre NVARCHAR(50)
    );

    CREATE TABLE #Pedidos (
        ID INT PRIMARY KEY,
        Producto NVARCHAR(50)
    );

    -- Insertar datos válidos
    INSERT INTO #Clientes (ID, Nombre) VALUES (1, 'Perry');
    INSERT INTO #Pedidos (ID, Producto) VALUES (1, 'Laptop');

    -- Intentar insertar un ID duplicado en ambas tablas
    INSERT INTO #Clientes (ID, Nombre) VALUES (1, 'Lulu');
    INSERT INTO #Pedidos (ID, Producto) VALUES (1, 'Celular');

END TRY
BEGIN CATCH
    PRINT 'Número de error: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
    PRINT 'Estado del error: ' + CAST(ERROR_STATE() AS NVARCHAR);
    PRINT 'Línea del error: ' + CAST(ERROR_LINE() AS NVARCHAR);
    PRINT 'Mensaje de error: ' + ERROR_MESSAGE();
END CATCH;
GO



-- TRY CATCH



-- Utilizar la Base de Datos NORTHWND
USE NORTHWND
GO


-- Crear la Tabla dbErros
CREATE TABLE dbErros
         (ErrorID        INT IDENTITY(1, 1),
          UserName       VARCHAR(100),
          ErrorNumber    INT,
          ErrorState     INT,
          ErrorSeverity  INT,
          ErrorLine      INT,
          ErrorProcedure VARCHAR(MAX),
          ErrorMessage   VARCHAR(MAX),
          ErrorDateTime  DATETIME)
GO


-- Consultar la Tabla dbErros
SELECT * FROM dbErros
GO


-- Funci�n SUSER_SNAME
SELECT SUSER_SNAME()
GO



-- Consultar la Tabla Customers
SELECT * FROM Customers
GO



-- Control de Errores TRY ... CATCH
BEGIN TRY    
    INSERT INTO Customers(CustomerID, CompanyName, ContactName, ContactTitle, Address, 
							City, Region, PostalCode, Country, Phone, Fax)
	VALUES('ALFKI', 'Microsoft Company', 'Bill Gates', 'Owner', NULL, 
			'Redmond', 'Washington', '98008', 'USA', NULL, NULL)
END TRY
BEGIN CATCH
	INSERT INTO dbo.dbErros
	VALUES(SUSER_SNAME(), ERROR_NUMBER(), ERROR_STATE(),  ERROR_SEVERITY(),
			ERROR_LINE(), ERROR_PROCEDURE(), ERROR_MESSAGE(), GETDATE())
END CATCH
GO


-- Consultar la Tabla dbErros
SELECT * FROM dbErros
GO



-- Control de Errores TRY ... CATCH
BEGIN TRY    
    INSERT INTO Customers(CustomerID, CompanyName, ContactName, ContactTitle, Address, 
							City, Region, PostalCode, Country, Phone, Fax)
	VALUES('ZMICO', 'Microsoft Company', 'Bill Gates', 'Owner', NULL, 
			'Redmond', 'Washington', '98008', 'USA', NULL, NULL)
END TRY
BEGIN CATCH
	INSERT INTO dbo.dbErros
	VALUES(SUSER_SNAME(), ERROR_NUMBER(), ERROR_STATE(),  ERROR_SEVERITY(),
			ERROR_LINE(), ERROR_PROCEDURE(), ERROR_MESSAGE(), GETDATE())
END CATCH
GO


-- Consultar la Tabla Customers
SELECT * FROM Customers
GO


BEGIN TRY
    -- Generar un error de división por cero
    PRINT 1/0;
END TRY
BEGIN CATCH
    PRINT 'Número de error: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
    PRINT 'Gravedad del error: ' + CAST(ERROR_SEVERITY() AS NVARCHAR);
    PRINT 'Estado del error: ' + CAST(ERROR_STATE() AS NVARCHAR);
    PRINT 'Línea del error: ' + CAST(ERROR_LINE() AS NVARCHAR);
    PRINT 'Mensaje de error: ' + ERROR_MESSAGE();
END CATCH;
GO
