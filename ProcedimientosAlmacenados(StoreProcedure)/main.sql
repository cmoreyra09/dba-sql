/*

    Store Procedure :

    Un procedimiento Almacenado (Stored Procedure) es un conjunto de instrucciones SQL
    predefinidas que se almacenan en las bases de datos y se pueden ejecutar cuando sea
    necesario. Los procedimientos almacenados permiten encapsular logica de negocio compleja
    en una unica unidad que puede ser reutilizada

    Al creear un procedimiento almacenado se puede hacer lo siguiente.


    - Consultando Datos con Procedimientos Almacenados (Stored Procedure)
    - Pasar Parametros al Procedimiento Almacenado (Store Procedure )
    - Crear un procedimiento almacenado (Store Procedure) Simple
    - Trabajar con Procedimiento Almacenado (Store Procedure) Dinamicos.
    - Ejecutar Procedimiento Almacenado (Store Procedure)
    - Examinar un procedimiento almacenado (Store Procedure)
    - Modificar 


    Caracteristicas de un Procedimiento almacenado :


    -  Reusabilidad  :
        Que pueden ser utilizados multiples veces por diferente aplicaciones o usuarios

    -  Encapsulacion :
        Se refiere a que almacena la regla de negocio lo que permite mantener el codigo centralizado .
    
    -  Rendimiento   :
        Establece un  alto rendimiento al esta precompilado, los procedimiento almacenado tienen a ejecutarse mas rapido
        a estar ejecutar query de forma dinamica.

    -  Seguridad
        Estable permites implicitos a usuarios puedan tener acceso a la misma.


    -  Manejo de Parametros :
        Pueden aceptar parametros de entradas y pueden ser flexibles para adaptarse a diferentes ocaciones.

    -  Transaccion :
        Puden contener transacciones , lo que permite asegurar que un conjunto de operaciones se ejecuta correctamente.
        


*/



/*
🔹 SET ANSI_NULLS ON
✅ Controla cómo se comparan los valores NULL.

ON (Recomendado): NULL = NULL es siempre falso. Para comparar NULL, debes usar IS NULL.
OFF (Obsoleto): Permite que NULL = NULL sea verdadero.
🔹 Ejemplo:

sql
Copy
Edit
SET ANSI_NULLS ON;
SELECT * FROM Clientes WHERE Nombre = NULL;  -- Nunca devuelve resultados

SET ANSI_NULLS OFF;
SELECT * FROM Clientes WHERE Nombre = NULL;  -- Podría devolver filas si hay NULLs
📌 Siempre usa ON porque OFF es obsoleto y será eliminado en futuras versiones de SQL Server.

🔹 SET QUOTED_IDENTIFIER ON
✅ Define si SQL Server reconoce comillas dobles (") para nombres de objetos.

ON (Recomendado): "Columna" es un identificador de objeto (nombre de tabla o columna).
OFF: "Texto" es tratado como una cadena de texto (igual a 'Texto').
🔹 Ejemplo:

sql
Copy
Edit
SET QUOTED_IDENTIFIER ON;
SELECT "Nombre" FROM Clientes;  -- Correcto si "Nombre" es un nombre de columna

SET QUOTED_IDENTIFIER OFF;
SELECT "Nombre" FROM Clientes;  -- Error, porque lo trata como texto
📌 Siempre usa ON porque mejora la compatibilidad con ANSI SQL.

🔹 SET NOCOUNT ON
✅ Evita mostrar el mensaje "X filas afectadas" tras cada consulta.

ON: No muestra el conteo de filas afectadas (mejora rendimiento).
OFF: Muestra el conteo de filas afectadas.
🔹 Ejemplo:

sql
Copy
Edit
SET NOCOUNT ON;
UPDATE Clientes SET Estado = 'Activo' WHERE Id = 1;  -- No muestra "1 fila(s) afectada(s)"

SET NOCOUNT OFF;
UPDATE Clientes SET Estado = 'Activo' WHERE Id = 1;  -- Muestra "1 fila(s) afectada(s)"
📌 Siempre usa ON en procedimientos almacenados para reducir tráfico innecesario entre SQL Server y la aplicación.

📌 Resumen
Configuración	Recomendado	¿Para qué sirve?
SET ANSI_NULLS ON	✅ ON	Trata NULL = NULL como falso (usar IS NULL en su lugar).
SET QUOTED_IDENTIFIER ON	✅ ON	Permite usar comillas dobles ("Columna") para nombres de objetos.
SET NOCOUNT ON	✅ ON	Oculta el mensaje de "filas afectadas", mejorando rendimiento.
💡 Conclusión: Siempre usa SET ANSI_NULLS ON, SET QUOTED_IDENTIFIER ON y SET NOCOUNT ON en procedimientos almacenados.

*/