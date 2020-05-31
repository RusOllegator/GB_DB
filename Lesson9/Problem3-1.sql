/*
Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/

USE shop;

DROP FUNCTION IF EXISTS hello;

DELIMITER //
CREATE FUNCTION hello()
RETURNS VARCHAR(100) NO SQL
BEGIN
	DECLARE curr_time INT DEFAULT HOUR(NOW());

	IF curr_time >= 0 and curr_time < 6 THEN 
		RETURN 'Доброй ночи';
	ELSEIF curr_time >= 6 and curr_time < 12 THEN
		RETURN 'Доброе утро';
	ELSEIF curr_time >= 12 and curr_time < 18 THEN
		RETURN 'Добрый день';
	ELSE 
		RETURN  'Добрый вечер';
	END IF;
END
DELIMITER ;

SELECT hello();
 
