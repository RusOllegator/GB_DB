CREATE DATABASE IF NOT EXISTS example;

USE example;

CREATE TABLE example (
	id int NOT null,
	name varchar(255) NOT null
);

INSERT INTO example (id,name) VALUES 
(1, '��� 1'),
(2, '��� ���'),
(3, '��� three');