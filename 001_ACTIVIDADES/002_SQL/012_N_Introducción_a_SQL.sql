CREATE DATABASE myMusic2;


--Creación de la tabla
CREATE TABLE Albums (
	AlbumID INT PRIMARY KEY,
	Title VARCHAR(255),
	Artist VARCHAR(255),
	ReleaseYear INT,
	Genre VARCHAR(255),
	Label VARCHAR(255)
);


--Agregar una fila a la tabla
INSERT INTO Albums (AlbumID, Title, Artist, ReleaseYear, Genre, Label) VALUES 
(1, 'Back in Black', 'AC/DC', 1980, 'Rock', 'Atlantic Records');


--Visualización de la tabla 
SELECT * FROM Albums;

SELECT Title, Artist FROM Albums


-- Se carga base de datos a utilizar
USE Chinook;

SELECT * FROM Artist;


-- Visualizar todas las tablas del sistema, mediante el uso de "name"
SELECT name FROM sys.tables;


SELECT TOP 5 * FROM Artist;

SELECT * FROM Artist WHERE ArtistId = 10; 


-- Ordenar datos
SELECT * FROM  Artist ORDER BY Name ASC;

SELECT * FROM  Artist ORDER BY Name DESC;


--Obtener el total de canciones 
SELECT COUNT(*) AS TotalTracks FROM Track;

SELECT * FROM Invoice;


--Total vendido
SELECT SUM(Total) AS Ventas FROM Invoice;

SELECT * FROM Track;


--Promedio de duración de las canciones
SELECT AVG(Milliseconds) AS  Duracion FROM Track;

SELECT MIN(Milliseconds) AS Min_Track, MAX(Milliseconds) AS Max_Track FROM Track;


--Los registros agregados aparecen al final
INSERT INTO Artist(ArtistID, Name) VALUES (276, 'Valentín Eizalde');

SELECT * FROM Artist;


--Agregar columna
ALTER TABLE Artist ADD Edad INT;

EXEC sp_rename 'Artist.Edad', 'Numero', 'COLUMN';

UPDATE Artist SET Name = 'Peso pluma' WHERE ArtistID = 276;

SELECT * FROM Artist;


SELECT GenreID, COUNT(*) AS Total_Track FROM Track GROUP BY GenreID ORDER BY Total_Track DESC;


-- WHERE siempre va antes del GROUP BY, después tiene que ir HAVING
SELECT AlbumId, AVG(Milliseconds) AS Duracion FROM Track GROUP BY AlbumId HAVING AVG(Milliseconds) > 231636;

SELECT AlbumId, AVG(Milliseconds) AS Duracion FROM Track WHERE GenreId =1 GROUP BY AlbumId, GenreId HAVING AVG(Milliseconds) > 231636;


--Unión de tablas
SELECT Track.TrackId, Track.Name, Album.Title FROM Track INNER JOIN Album ON Track.AlbumId = Album.AlbumId;

SELECT * FROM Track;

SELECT * FROM Album;

SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, Invoice.InvoiceId FROM Customer LEFT JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId;

SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, Invoice.InvoiceId FROM Invoice RIGHT JOIN Customer ON Customer.CustomerId = Invoice.CustomerId;

SELECT t.TrackId, t.Name AS TrackName, ar.Name AS ArtistName, al.Title As AlbumTitle FROM Track t
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock';


--CREATE VIEW canciones AS (
CREATE OR ALTER VIEW canciones AS (
SELECT t.TrackId, t.Name AS TrackName, ar.Name AS ArtistName, al.Title AS AlbumTitle
FROM Track t
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock');


SELECT * FROM canciones;

SELECT DISTINCT ArtistName FROM canciones;

SELECT COUNT(DISTINCT ArtistName) FROM canciones;

--Eliminar vistas
DROP VIEW canciones; 

--EJERCICIOS

--EJERCICIO 01: Escribe una consulta para recuperar toda la información de los clientes de la tabla "Customer".

SELECT * FROM Customer;

--EJERCICIO 02: Escribe una consulta para recuperar el nombre de la pista y el precio unitario de la tabla "Track" para todas las pistas con un precio unitario mayor a $0.99.

SELECT Name, UnitPrice FROM Track WHERE UnitPrice > 0.99;

--EJERCICIO 03: Escribe una consulta para recuperar el título del álbum, el nombre del artista y la cantidad de pistas para todos los álbumes en la tabla "Album", ordenados por la cantidad de pistas de forma descendente.

SELECT al.Title AS AlbumTitle, ar.Name AS ArtistName, COUNT(t.TrackId) AS TrackCount FROM Album al
JOIN Artist ar ON al.ArtistId = ar.ArtistId
JOIN Track t ON al.AlbumId = t.AlbumId
GROUP BY al.Title, ar.Name ORDER BY TrackCount DESC;


--EJERCICIO 04: Escribe una consulta para recuperar el nombre del cliente, la fecha de la factura y el monto total para todas las facturas en la tabla "Invoice", ordenadas por la fecha de la factura de forma ascendente.

SELECT c.FirstName + ' ' + c.LastName AS CustomerName, i.InvoiceDate, i.Total FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
ORDER BY i.InvoiceDate ASC;

--EJERCICIO 05: Escribe una consulta para recuperar el nombre del género y el número total de pistas para cada género de las tablas "Genre" y "Track", agrupados por género y ordenados por la cantidad de pistas de forma descendente.

SELECT a.Name, COUNT(b.TrackId) as Num_canciones FROM Genre a
INNER JOIN Track b ON a.GenreId = b.GenreId GROUP BY a.Name ORDER BY Num_canciones DESC;


