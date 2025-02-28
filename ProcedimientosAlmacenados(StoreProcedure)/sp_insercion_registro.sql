

		IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Medicamentos') 
			BEGIN
				DROP TABLE Medicamentos;
			END
				
					CREATE TABLE Medicamentos (
					
						idMedicamentos			INT PRIMARY KEY,
						nombre					VARCHAR(30),
						descripcion				VARCHAR(30)
					
					
					);

		CREATE OR ALTER PROCEDURE sp_insertIntoCollection ( 
										
										@idMedicamentos INT ,
										@nombre			VARCHAR(255) ,
										@descripcion	VARCHAR(255)
										
										)

			AS 
					BEGIN

					SET NOCOUNT ON;

					DECLARE @Validation	AS NVARCHAR(MAX) SET @Validation = (SELECT COUNT(*) FROM Medicamentos WHERE idMedicamentos = @idMedicamentos);

					
					IF @Validation = 1
						BEGIN
							
							PRINT 'El registro si existe'

						END
					
					ELSE IF @Validation = 0 
						BEGIN

							INSERT INTO Medicamentos
								VALUES (@idMedicamentos,@nombre,@descripcion)

							PRINT 'Se agrego el registro Correctamente'

						END

					 ELSE
						PRINT 'Opcion Incorrecta'

					END

		

		EXEC sp_insertIntoCollection 123,'Carlos','Testing'



