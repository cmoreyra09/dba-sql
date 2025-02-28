-- Usar la Base de Datos movies
USE movies
GO


-- Consultar la Tabla movie
SELECT title
FROM movie
WHERE title LIKE 'C%'
GO


-- Crear el �ndice no agrupado en la columna "title"
CREATE NONCLUSTERED INDEX NCI_title
ON movie(title)
GO


-- Consultas las columnas title y vote_average
SELECT title, vote_average
FROM movie
WHERE title LIKE 'C%'
GO


-- Crear el �ndice no agrupado en la columna "vote_average"
CREATE NONCLUSTERED INDEX NCI_vote_average
ON movie(vote_average)
GO



-- Volver a consultar la Tabla movie
SELECT title, vote_average
FROM movie
WHERE title LIKE 'C%'
GO



-- Consultar las pel�culas que comiencen con "C" y tengan un
-- promedio de votos mayor a 8
SELECT title, vote_average
FROM movie
WHERE title LIKE 'C%' AND vote_average > 8
GO