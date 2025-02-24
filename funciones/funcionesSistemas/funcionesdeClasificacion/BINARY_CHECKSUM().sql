


/* ¿Qué hace CHECKSUM(*) en SQL Server?
   
    CHECKSUM(*) :
    genera un valor hash numérico basado en todas las columnas de la fila. 
    Se usa para comparar registros de manera eficiente, sin necesidad de escribir todas las columnas manualmente.



    Explicación Técnica
    CHECKSUM(*) toma todos los valores de la fila y calcula un número único basado en esos valores.
    Si dos filas tienen los mismos valores en todas las columnas, el CHECKSUM(*) será igual.
    Si hay un cambio en alguna columna, el CHECKSUM(*) probablemente cambiará (aunque no es 100% garantizado, más abajo explico por qué).



Ejemplo Práctico
Ejemplo con una tabla de empleados
*/


CREATE TABLE Empleados (
    ID INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Departamento NVARCHAR(50),
    Salario DECIMAL(10,2)
);

INSERT INTO Empleados VALUES
(1, 'Perry', 'TI', 5000.00),
(2, 'Lulu', 'Ventas', 4500.00),
(3, 'Sasha', 'TI', 5000.00),
(4, 'Perry', 'TI', 5000.00); -- Fila duplicada de la primera
Ahora calculamos el CHECKSUM(*):


SELECT ID, Nombre, Departamento, Salario, CHECKSUM(*) AS HashFila
FROM Empleados;


ID	Nombre	Departamento	Salario	    HashFila
1	Perry	TI	            5000.00	    1234567
2	Lulu	Ventas	        4500.00	    9876543
3	Sasha	TI	            5000.00	    7654321
4	Perry	TI	            5000.00	    1234567

--Observa que las filas 1 y 4 tienen el mismo HashFila, porque son idénticas.

/*
    Uso de CHECKSUM(*) para Identificar Duplicados
    Podemos usarlo en una consulta con ROW_NUMBER() para detectar duplicados:
*/



WITH CTE_Duplicados AS (
    SELECT *, 
           ROW_NUMBER() OVER(PARTITION BY CHECKSUM(*) ORDER BY (SELECT NULL)) AS NumFila
    FROM Empleados
)
SELECT * FROM CTE_Duplicados WHERE NumFila > 1;


-- Esto muestra solo los registros duplicados.

/*
    Es CHECKSUM(*) 100% Confiable? (¡Cuidado!)
    No es infalible:
    CHECKSUM(*) usa un algoritmo hash, y como en todos los hashes, puede haber colisiones (dos filas diferentes con el mismo checksum).
    Ejemplo de colisión:

*/


SELECT CHECKSUM('ABC'), CHECKSUM('ABD');
--A veces puede dar el mismo valor, aunque los textos son distintos.

--Alternativa Más Precisa: BINARY_CHECKSUM(*)
--Si necesitas mayor precisión y menos riesgo de colisión, usa BINARY_CHECKSUM(*):


SELECT ID, Nombre, Departamento, Salario, BINARY_CHECKSUM(*) AS HashFila
FROM Empleados;
-- BINARY_CHECKSUM(*) es más seguro que CHECKSUM(*) porque toma en cuenta más variaciones en los datos.

/*Resumen

Método	            ¿Para qué sirve?	                    ¿Cuándo usarlo?	                                                ¿Riesgo de colisión?
CHECKSUM(*)	        Genera un hash de todas las columnas	Detectar duplicados rápidamente en tablas grandes	             Sí, aunque bajo
BINARY_CHECKSUM(*)	Más preciso que CHECKSUM(*)	            Detectar cambios en registros con menor riesgo de colisión	     Menos riesgo


Conclusión

CHECKSUM(*) es útil para encontrar registros duplicados rápidamente sin escribir todas las columnas.

Puede generar colisiones en datos distintos, por lo que no es ideal para comparaciones 100% exactas.

Si necesitas mayor precisión, usa BINARY_CHECKSUM(*).

En la mayoría de los casos, CHECKSUM(*) es suficiente para detectar duplicados, pero si los datos son críticos, usa BINARY_CHECKSUM(*). 🚀

*/