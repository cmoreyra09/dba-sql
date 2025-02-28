


/*
	
	Si ya se encuentra definido un indice clustered , la primary key como cuando se crea automaticamente el indice en este caso seria como 
	indice non-clustered


*/


/*
	Importante : 
		Cuando no se define un indice de tipo clustered y se establece un primary key a una columna
		de la tabla automaticamente se crea el indice de tipo clustered.

*/




-- Usar la Base de Datos movies
USE movies
GO



-- ========== TABLE SCAN ========== --
-- Consultar la Tabla movie
SELECT * FROM movie
GO

-- Consultar algunas columnas de la Tabla movie
SELECT title, budget, homepage, overview, runtime, 
		vote_average, vote_count 
FROM movie
GO



-- ========== HASH MATCH ========== --
-- Unir las Tablas movie, production_country y country
SELECT M.title, C.country_name
FROM movie M JOIN production_country PC ON M.movie_id = PC.movie_id
			 JOIN country C ON C.country_id = PC.country_id
GO




-- ========== CLUSTERED INDEX SCAN ========== --
-- Consultar la Tabla country
SELECT * FROM country
GO


-- Crear un Clustered Index en la Tabla country
CREATE CLUSTERED INDEX CI_country_id
ON country(country_id)
GO

-- Volver a consultar la Tabla country
SELECT * FROM country
GO


-- Crear un Clustered Index en la Tabla movie
CREATE CLUSTERED INDEX CI_movie_id
ON movie(movie_id)
GO


-- Crear un Clustered Index en la Tabla production_country
CREATE CLUSTERED INDEX CI_production_country
ON production_country(movie_id, country_id)
GO


-- Volver a consultar las Tablas movie, production_country y country
SELECT M.title, C.country_name
FROM movie M JOIN production_country PC ON M.movie_id = PC.movie_id
			 JOIN country C ON C.country_id = PC.country_id
GO



-- ========== CLUSTERED INDEX SCAN ========== --
-- Establecer las Primary Key
ALTER TABLE country
ADD CONSTRAINT PK_country_id PRIMARY KEY (country_id)
GO

ALTER TABLE movie
ADD CONSTRAINT PK_movie_id PRIMARY KEY (movie_id)
GO

ALTER TABLE person
ADD CONSTRAINT PK_person_id PRIMARY KEY (person_id) -- CI por defecto
GO

ALTER TABLE movie_cast
ADD CONSTRAINT PK_movCast PRIMARY KEY (movie_id, person_id) -- CI por defecto
GO

ALTER TABLE production_country
ADD CONSTRAINT PK_prodCountry PRIMARY KEY (movie_id, country_id)
GO

-- Establecer las Foreign Key
ALTER TABLE production_country
ADD CONSTRAINT FK_prodCount_country
FOREIGN KEY (country_id) REFERENCES country(country_id)
GO

ALTER TABLE production_country
ADD CONSTRAINT FK_prodCount_movie
FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
GO

ALTER TABLE movie_cast
ADD CONSTRAINT FK_movCast_person 
FOREIGN KEY (person_id) REFERENCES person(person_id)
GO

ALTER TABLE movie_cast
ADD CONSTRAINT FK_movCast_movie 
FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
GO


-- Consultar la Tabla country donde country_id sea mayor a 50
SELECT * FROM country
WHERE country_id > 50
GO



-- Volver a consultar las Tablas movie, production_country y country
SELECT M.title, C.country_name
FROM movie M JOIN production_country PC ON M.movie_id = PC.movie_id
			 JOIN country C ON C.country_id = PC.country_id
WHERE M.movie_id > 3000 AND (C.country_id BETWEEN 20 AND 30)
GO


-- ========== Parallelism ========== --
SELECT M.title, C.country_name,
		MC.character_name, MC.cast_order, P.person_name
FROM movie M JOIN production_country PC ON M.movie_id = PC.movie_id
			 JOIN country C ON C.country_id = PC.country_id
			 JOIN movie_cast MC ON MC.movie_id = M.movie_id
			 JOIN person P ON MC.person_id = P.person_id
GO


-- Cantidad de peliculas realizadas por Pa�s
SELECT C.country_name, COUNT(1) total
FROM movie M JOIN production_country PC ON M.movie_id = PC.movie_id
			 JOIN country C ON C.country_id = PC.country_id
GROUP BY C.country_name
ORDER BY total DESC
GO