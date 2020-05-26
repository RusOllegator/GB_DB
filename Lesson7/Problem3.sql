CREATE DATABASE IF NOT EXISTS Lesson7;
USE Lesson7;

/* Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
   Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.*/


DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  label VARCHAR(50) PRIMARY KEY,
  name VARCHAR(50)
) COMMENT = 'Города';

INSERT INTO cities 
  (label,name)
VALUES
  ('moscow','Москва'),
  ('irkutsk','Иркутск'),
  ('novgorod','Новгород'),
  ('kazan','Казань'),
  ('omsk','Омск');



DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id INT PRIMARY KEY,
  `from` VARCHAR(50),
  `to` VARCHAR(50),
  FOREIGN KEY (`from`)  REFERENCES cities (label)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (`to`)  REFERENCES cities (label)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) COMMENT = 'Рейсы';

INSERT INTO flights 
  (id,`from`,`to`)
VALUES
  (1,'moscow','omsk'),
  (2,'novgorod','kazan'),
  (3,'irkutsk','moscow'),
  (4,'omsk','irkutsk'),
  (5,'moscow','kazan');


select f.id 'Рейс', c.name 'Откуда', c2.name 'Куда' from 
	flights f
	JOIN
	cities c
	ON f.`from` = c.label 
	JOIN
	cities c2 
	ON f.`to` = c2.label;



