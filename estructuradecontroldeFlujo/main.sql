/*


    Estructura Control de Flujos:

BEGIN TRY
    -- Intento dividir por cero (esto generará un error)
    SELECT 10 / 0;
END TRY
BEGIN CATCH
    PRINT 'Se ha producido un error.';
    PRINT ERROR_MESSAGE(); -- Muestra el mensaje del error
END CATCH;


    La estructura de control de flujo se refiere a las instrucciones y contrucciones que permiten 
    dirigir ejecucion de codigo Transact SQL de acuerdo con condiciones especificas, decisiones logicas 
    y bucles


    Estas estructuras permiten controla como se ejecutan las sentencias SQL y como se manejan las condiciones y los errores
    en los scripts



    Las estructuras de control de flujo son esenciales para escribir scrips transal SQL robustos
    y flexibles permiten realizar tareas condicionales, tareas repetitivas, manejo de errores y 
    mejorar la logica de procesamiento de datos. Estas herramientas son fundamentales para 
    desarrollar nuestra logica, poder resolver problemas ejecicios y mediante el codigo
    transact SQL soluciona diversas situaciones de manera eficiente y efectiva
    





*/

/*

1. BEGIN ... END
Agrupa múltiples sentencias SQL en un solo bloque.
Se usa para definir el cuerpo de un procedimiento almacenado, función, trigger o cualquier estructura de control.
Ejemplo:
*/


BEGIN
    INSERT INTO Clientes (Nombre) VALUES ('Juan');
    UPDATE Clientes SET Estado = 'Activo' WHERE Nombre = 'Juan';
END

/*
2. IF ... ELSE
Permite ejecutar diferentes bloques de código según si una condición es TRUE o FALSE.
Ejemplo:
*/


IF EXISTS (SELECT * FROM Clientes WHERE Nombre = 'Juan')
    PRINT 'El cliente ya existe';
ELSE
    INSERT INTO Clientes (Nombre) VALUES ('Juan');

/*
3. CASE
Se usa para evaluar múltiples condiciones y devolver un valor según el caso que se cumpla.
Puede ser usado en consultas SELECT, UPDATE, etc.
Ejemplo:
*/

SELECT 
    Nombre, 
    Estado,
    CASE 
        WHEN Estado = 'A' THEN 'Activo'
        WHEN Estado = 'I' THEN 'Inactivo'
        ELSE 'Desconocido'
    END AS EstadoDescripcion
FROM Clientes;


/*
4. WHILE
Ejecuta un bloque de código repetidamente mientras se cumpla una condición.
Ejemplo:
*/


DECLARE @contador INT = 1;

WHILE @contador <= 5
BEGIN
    PRINT 'Iteración número ' + CAST(@contador AS VARCHAR);
    SET @contador = @contador + 1;
END

/*
5. BREAK y CONTINUE
BREAK: Sale del bucle inmediatamente.
CONTINUE: Salta la iteración actual y pasa a la siguiente.
Ejemplo:
*/

DECLARE @i INT = 1;
WHILE @i <= 10
BEGIN
    IF @i = 5
        BREAK; -- Sale del bucle cuando @i = 5
    
    PRINT 'Valor de i: ' + CAST(@i AS VARCHAR);
    SET @i = @i + 1;
END

/*
6. RETURN
Finaliza la ejecución de un procedimiento almacenado o función y devuelve un valor opcional.
Ejemplo:
*/

CREATE PROCEDURE VerificarCliente @Nombre VARCHAR(50)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Clientes WHERE Nombre = @Nombre)
    BEGIN
        PRINT 'Cliente no encontrado';
        RETURN; -- Finaliza la ejecución
    END
    PRINT 'Cliente encontrado';
END;

/*
7. GOTO
Salta a una etiqueta específica dentro del código.
No es recomendable usarlo porque hace que el código sea menos estructurado.
Ejemplo:
*/


DECLARE @valor INT = 10;
IF @valor > 5
    GOTO Fin;

PRINT 'Este mensaje no se ejecutará si @valor > 5';
Fin:
PRINT 'Fin del procedimiento';

/*
8. TRY ... CATCH
Permite manejar errores en un bloque de código.
Captura excepciones y permite ejecutar código alternativo cuando ocurre un error.
Ejemplo:
*/

BEGIN TRY
    -- Intento dividir por cero (esto generará un error)
    SELECT 10 / 0;
END TRY
BEGIN CATCH
    PRINT 'Se ha producido un error.';
    PRINT ERROR_MESSAGE(); -- Muestra el mensaje del error
END CATCH;

--Estas estructuras te permiten controlar el flujo de ejecución en T-SQL dentro de SQL Server, haciendo tu código más robusto y flexible. 🚀