CREATE DATABASE IF NOT EXISTS example;

USE example;

CREATE TABLE example (
	id int NOT null,
	name varchar(255) NOT null
);

INSERT INTO example (id,name) VALUES 
(1, 'Имя 1'),
(2, 'Имя два'),
(3, 'Имя three');