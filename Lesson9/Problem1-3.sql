/*
 Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17.
 Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.
*/
USE shop;

-- Задействуем текущую таблицу
DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  description TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

INSERT INTO products
  (name, description, price, catalog_id, created_at)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1,'2018-08-01' ),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1,'2016-08-04'),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1,'2018-08-16'),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1,'2018-08-17');
  
set @date_num:=STR_TO_DATE('2018-07-31', '%Y-%m-%d'); -- сделаем счетчик даты для заполнения таблицы

-- создадим временную таблицу с диапазоном дат за август
CREATE TEMPORARY TABLE IF NOT EXISTS august_2018 ( _date datetime NOT NULL KEY) as
	SELECT  @date_num:= DATE_ADD(@date_num, INTERVAL 1 DAY) _date  -- Заджойним трижды, чтобы хватило количество записей:
	FROM products p1, products p2, products p3 LIMIT 31;

SELECT a._date, 
       CASE
   		 WHEN p.created_at IS NULL THEN 0
    	 ELSE 1
		END as IS_EXIST
FROM august_2018 a LEFT JOIN products p ON a._date = DATE(p.created_at)
ORDER BY 1;
