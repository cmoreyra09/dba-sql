-- Usar la Base de Datos HospitalABC
USE HospitalABC
GO


-- Consultar la Tabla Medicamentos
SELECT * FROM Medicamentos
GO


-- Crear Procedimiento Almacenado
CREATE OR ALTER PROC SP_005_EliminarMedicamento
(
	@idMedicamento	INT
)
AS
BEGIN
	
	IF EXISTS ( SELECT idMedicamento FROM Medicamentos
				WHERE idMedicamento = @idMedicamento)
	BEGIN
		DELETE FROM Medicamentos
		WHERE idMedicamento = @idMedicamento

		PRINT( 'El Medicamento se elimin� correctamente!' )
	END
	ELSE
	BEGIN
		PRINT( 'Error, el idMedicamento NO existe!' )
	END

END
GO


-- Eliminar un registro a partir del Procedimiento Almacenado
EXEC SP_005_EliminarMedicamento 10 --ERROR
GO

EXEC SP_005_EliminarMedicamento 7 --CORRECTO
GO


-- Consultar la Tabla Medicamentos
SELECT * FROM Medicamentos
GO