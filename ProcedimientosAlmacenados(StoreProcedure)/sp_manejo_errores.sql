-- Usar la Base de Datos HospitalABC
USE HospitalABC
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


-- Crear un Procedimiento Almacenado de Inserci�n
CREATE OR ALTER PROCEDURE SP_009_InsertarMedico
(
	@nombre			VARCHAR(40),
	@apellido		VARCHAR(40),
	@especialidad	VARCHAR(30),
	@telefono		CHAR(9),
	@email			VARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY

		INSERT INTO Medicos(nombre, apellido, especialidad, telefono, email)
				VALUES(@nombre, @apellido, @especialidad, @telefono, @email);

		PRINT( 'El registro se agreg� correctamente!' )

	END TRY
	BEGIN CATCH

		INSERT INTO dbo.dbErros
		VALUES(SUSER_SNAME(), ERROR_NUMBER(), ERROR_STATE(),  ERROR_SEVERITY(),
				ERROR_LINE(), ERROR_PROCEDURE(), ERROR_MESSAGE(), GETDATE())

		PRINT( 'Error al insertar un registro!' )

	END CATCH
END
GO


-- Consultar la Tabla Medicos
SELECT * FROM Medicos
GO


-- Insertar registro a partir de Procedimiento Almacenado
-- Correcto
EXEC SP_009_InsertarMedico 'Karen', 'D�az', 'Neurolog�a', '900000000', 'karen.d@example.com'
GO

-- Incorrecto(Restricci�n)
EXEC SP_009_InsertarMedico 'Carlos', 'Marquez', 'Neumolog�a', '900000000', 'carlos.m@example.com'
GO


-- Consultar la Tabla dbErros
SELECT * FROM dbErros
GO