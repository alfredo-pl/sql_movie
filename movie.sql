--creación de la base de datos
CREATE DATABASE peliculas;

--creación tabla peliculas
CREATE TABLE peliculas (
id INT PRIMARY KEY,
pelicula VARCHAR(120),
anio INT,
director VARCHAR(120)
);

--creación tabla reparto
CREATE TABLE reparto (
    pelicula_reparto INT, 
    actor VARCHAR(120), 
    FOREIGN KEY (pelicula_reparto) REFERENCES peliculas(id)
);

--CARGAR DE ARCHIVO a la tabla peliculas
\COPY peliculas FROM './peliculas.csv' csv header;
--CARGAR DE ARCHIVO a la tabla reparto
\COPY reparto FROM './reparto.csv' csv header;

--listar actores titanic
SELECT actor, pelicula , anio, director from reparto INNER JOIN 
peliculas on reparto.pelicula_reparto = peliculas.id WHERE pelicula = 'Titanic';

--listar peliculas actor harrison ford
SELECT pelicula  from peliculas INNER JOIN 
reparto on reparto.pelicula_reparto = peliculas.id WHERE actor = 'Harrison Ford';

--listar 10 directores NOMBRE Y CANTIDAD DE PELICULAS
SELECT director, COUNT(*) as cantidad FROM peliculas GROUP BY director ORDER BY cantidad DESC LIMIT 10;

--CANTIDAD DE ACTORES DISTINTOS
SELECT COUNT(DISTINCT actor) FROM reparto;

--PELICULAS ENTRE 90 Y 99 ordenadas por el TITULO
SELECT pelicula, anio FROM peliculas WHERE anio BETWEEN 1990 and 1999 ORDER BY pelicula ASC;

--listar reparto de las peliculas el año 2001
SELECT actor FROM reparto INNER JOIN peliculas ON reparto.pelicula_reparto = peliculas.id WHERE anio = 2001;

--listar actores de la pelicula mas nueva
SELECT actor,anio, pelicula  FROM reparto INNER JOIN peliculas ON reparto.pelicula_reparto = peliculas.id ORDER BY anio DESC, pelicula DESC LIMIT 1;