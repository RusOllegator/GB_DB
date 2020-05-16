use lesson5;

#Подсчитайте средний возраст пользователей в таблице users

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
  
 
select AVG (YEAR(CURRENT_DATE()) - YEAR(birthday_at)) from users;

#Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.


SELECT case date_format( DATE_ADD(birthday_at,INTERVAL (YEAR(CURRENT_DATE()) - YEAR(birthday_at)) YEAR),'%w')
       when 0 then 'воскресенье'
       when 1 then 'понедельник'
       when 2 then 'вторник'
       when 3 then 'среда'
       when 4 then 'четверг'
       when 5 then 'пятница'
       when 6 then 'суббота' end week_day,
       count(1) `Количество`
from users
group by week_day; 


#Подсчитайте произведение чисел в столбце таблицы

DROP TABLE IF EXISTS my_values;
CREATE TABLE my_values (
  value INT
) ;

INSERT INTO my_values (value ) VALUES
  (30),
  (4),
  (4),
  (1)
 
SELECT exp(SUM(log(value))) FROM my_values;
  
 