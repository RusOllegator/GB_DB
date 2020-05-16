CREATE database lesson5;
use lesson5;

#Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(100),
  updated_at VARCHAR(100)
) COMMENT ='Пользователи';


INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

 UPDATE users 
 set created_at =  IF ( created_at is NULL , date_format(NOW() ,'%d.%m.%Y %H:%i'),created_at ),
	 updated_at = IF ( updated_at is NULL , date_format(NOW() ,'%d.%m.%Y %H:%i') , updated_at );

# select * from users;

/*Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10".
 Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения. */

UPDATE users SET created_at = STR_TO_DATE(created_at,'%d.%m.%Y %H:%i'),
	   updated_at = STR_TO_DATE(updated_at,'%d.%m.%Y %H:%i'); 

/*Тут похоже нужен commit, при выполнении как скрипта не отрабатывает*/
	  
alter table users modify created_at datetime;
alter table users modify updated_at datetime;



 