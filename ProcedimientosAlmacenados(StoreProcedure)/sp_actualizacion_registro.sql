-- Usar la Base de Datos HospitalABC
USE HospitalABC
GO


-- Consultar la Tabla Medicamentos
SELECT * FROM Medicamentos
GO


-- Crear Procedimiento Almacenado
CREATE OR ALTER PROC SP_004_ActualizarMedicamento
(
	@idMedicamento	INT,
	@nombre			VARCHAR(40),
	@descripcion	VARCHAR(255) = NULL
)
AS
BEGIN
	
	IF EXISTS ( SELECT idMedicamento FROM Medicamentos
				WHERE idMedicamento = @idMedicamento)
	BEGIN
		UPDATE Medicamentos
		SET		nombre = @nombre,
				descripcion = @descripcion
		WHERE	idMedicamento = @idMedicamento

		PRINT( 'El Medicamento se actualiz� correctamente!' )
	END
	ELSE
	BEGIN
		PRINT( 'Error, el idMedicamento NO existe!' )
	END

END
GO


-- Actualizar un registro a partir de Procedimiento Almacenado
EXEC SP_004_ActualizarMedicamento 10, 'Salbutamol', 'Broncodilatador' --ERROR
GO

EXEC SP_004_ActualizarMedicamento 7, 'Salbutamol', 'Broncodilatador' --CORRECTO
GO


-- Consultar la Tabla Medicamentos
SELECT * FROM Medicamentos
GO