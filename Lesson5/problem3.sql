/*
  В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
  Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
 */

CREATE database IF NOT EXISTS lesson5;
USE lesson5;

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT INTO storehouses_products (storehouse_id, product_id, value ) VALUES
  (1,1,100),
  (1,2,0),
  (1,3,15),
  (1,4,1654),
  (1,5,43),
  (2,3,2),
  (2,51,0),
  (4,45,543),
  (4,332,34),
  (4,1,0)

 #select * from storehouses_products;

 select * from storehouses_products s order by if (VALUE = 0,4294967295,VALUE)
