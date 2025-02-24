

/* Identificar duplicidades en una tabla */


BEGIN TRANSACTION

DECLARE @contador AS TINYINT SET @contador = 1;
DECLARE @Testing AS TABLE(

	id			TINYINT NOT NULL,
	nombre		VARCHAR(20) NOT NULL,
	curso		VARCHAR(20) NOT NULL,
	edad		TINYINT NOT NULL
	);

	BEGIN
		
		WHILE @contador <= 5
			BEGIN
			
			INSERT INTO @Testing
			VALUES(@contador,CONCAT('Estudiante',@contador),CONCAT('Curso',@contador),18+@contador)

			SET @contador = @contador +1

			END

	END;

--Reiniciar Contador
SET @contador = 1
--------------------

	BEGIN
		WHILE @contador <= 5
		BEGIN

			INSERT INTO @Testing
			VALUES(@contador,CONCAT('Estudiante',@contador),CONCAT('Curso',@contador),18+@contador)

			SET @contador = @contador + 1
			
		END
	END;



WITH TB_PRINCIPAL 
	AS (
		SELECT 
			T.*,
			ROW_NUMBER() OVER(PARTITION BY BINARY_CHECKSUM(*) ORDER BY (SELECT NULL)) AS NumFila
				FROM @Testing AS T
		) 
		SELECT 
			* FROM TB_PRINCIPAL 
				WHERE NumFila = 2

COMMIT TRANSACTION
GO


/*

    BINARY_CHECKSUM(*) convierte los valores de las columnas en una representación binaria y luego aplica una función hash para generar un número entero (INT).

    -- Proceso Interno

    Convierte cada columna en una secuencia de bytes (incluyendo diferencias de mayúsculas/minúsculas en texto).
    Combina los bytes de todas las columnas en un solo bloque binario.
    Aplica una función de dispersión (hashing) en ese bloque binario.
    Devuelve un INT de 32 bits como el resultado del hash.

    CHECKSUM(*) también genera un hash numérico, pero es menos sensible a cambios en los datos.

    No distingue mayúsculas/minúsculas en texto.
    Es más rápido, pero tiene mayor riesgo de colisión.
    Ignora diferencias en tipos de datos similares (por ejemplo, FLOAT y DECIMAL pueden dar el mismo CHECKSUM(*)).


*/