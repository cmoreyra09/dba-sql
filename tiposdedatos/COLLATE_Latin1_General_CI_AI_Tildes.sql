CREATE TABLE Palabras (
    Id INT IDENTITY PRIMARY KEY,
    Palabra NVARCHAR(100) COLLATE Latin1_General_CI_AI -- Permite tildes y ñ
);


INSERT INTO Palabras (Palabra) VALUES ('Canción'), ('Árbol'), ('Música');

SELECT * FROM Palabras WHERE Palabra = 'Arbol';  -- Encuentra 'Árbol' si es Accent Insensitive
SELECT * FROM Palabras WHERE Palabra = 'Árbol';  -- Solo encuentra si es Accent Sensitive

/*
Si una columna en SQL Server contendrá palabras con tildes (acentos) y otros caracteres especiales (como ñ o ü), debes elegir un tipo de dato con soporte para Unicode.

📌 Tipo de datos recomendado:
✅ NVARCHAR en lugar de VARCHAR.

🔹 Ejemplo de definición de columna con soporte para tildes
*/




CREATE TABLE Palabras (
    Id INT IDENTITY PRIMARY KEY,
    Palabra NVARCHAR(100) COLLATE Latin1_General_CI_AI -- Permite tildes y ñ
);

Explicación:
NVARCHAR(100):

/*
Usa NVARCHAR en lugar de VARCHAR porque NVARCHAR almacena texto en Unicode (UTF-16) y soporta caracteres especiales.
VARCHAR no siempre soporta caracteres con tildes correctamente, dependiendo del COLLATE.
COLLATE Latin1_General_CI_AI:

CI: Case Insensitive (No distingue mayúsculas de minúsculas).
AI: Accent Insensitive (Ignora tildes, es decir, á = a, é = e, etc.).
Si necesitas distinguir tildes, usa Latin1_General_CI_AS (Accent Sensitive).
🛠 Ejemplo de inserción y consulta:

*/

INSERT INTO Palabras (Palabra) VALUES ('Canción'), ('Árbol'), ('Música');

SELECT * FROM Palabras WHERE Palabra = 'Arbol';  -- Encuentra 'Árbol' si es Accent Insensitive
SELECT * FROM Palabras WHERE Palabra = 'Árbol';  -- Solo encuentra si es Accent Sensitive

/*
🎯 Resumen:
✅ NVARCHAR es ideal para texto con tildes y caracteres especiales.
✅ Usa COLLATE Latin1_General_CI_AI si no quieres distinguir tildes.
✅ Usa COLLATE Latin1_General_CI_AS si quieres distinguir tildes.

🔹 Si el texto viene de una aplicación que usa UTF-8, considera NVARCHAR siempre para evitar problemas de compatibilidad.
*/

/*

    Unicode es un estándar de codificación de caracteres que permite que las computadoras representen y manipulen textos de diferentes idiomas. 

*/