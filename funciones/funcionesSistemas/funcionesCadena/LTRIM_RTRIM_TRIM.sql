/*

    LTRIM : 

    Quita caracteres de espacio u otros caracteres especificados al principio de una cadena.

    RTRIM :

    Quita caracteres de espacio u otros caracteres especificados al final de una cadena.


    TRIM  :

    Quita caracteres de espacio del princip y del final de una cadena.

*/



-- Podemos estar ubicados en cualquier Base de Datos

--  LTRIM
SELECT '   Hola Mundo', LTRIM('   Hola Mundo')
GO

SELECT '123.Hola Mundo', LTRIM('Hola Mundo', '123.')
GO



-- RTRIM
SELECT 'Hola Mundo   ', RTRIM('Hola Mundo   ')
GO

SELECT 'Hola Mundo.123', RTRIM('Hola Mundo.123', '123.')
GO



-- TRIM
SELECT '    Hola Mundo    ', TRIM('    Hola Mundo    ')
GO

-- Eliminar Caracteres especificados de ambos lados de la cadena
SELECT '!#.  Hola Mundo  # ,', TRIM( '.!,# ' FROM '!#.  Hola Mundo  # ,')
GO

-- Eliminar Caracteres especificados al inicio de la cadena
SELECT '!#.  Hola Mundo  # ,', TRIM( LEADING '.!,# ' FROM '!#.  Hola Mundo  # ,')
GO

-- Eliminar Caracteres especificados al final de la cadena
SELECT '!#.  Hola Mundo  # ,', TRIM( TRAILING '.!,# ' FROM '!#.  Hola Mundo  # ,')
GO

-- Eliminar Caracteres especificados al principio y final de la cadena
SELECT '123Hola Mundo123', TRIM( BOTH '123' FROM '123Hola Mundo123')
GO