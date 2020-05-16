use lesson5;

#����������� ������� ������� ������������� � ������� users

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at VARCHAR(100),
  updated_at VARCHAR(100)
) COMMENT ='������������';

INSERT INTO users (name, birthday_at) VALUES
  ('��������', '1990-10-05'),
  ('�������', '1984-11-12'),
  ('���������', '1985-05-20'),
  ('������', '1988-02-14'),
  ('����', '1998-01-12'),
  ('�����', '1992-08-29');
  
 
select AVG (YEAR(CURRENT_DATE()) - YEAR(birthday_at)) from users;

#����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. ������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������.


SELECT case date_format( DATE_ADD(birthday_at,INTERVAL (YEAR(CURRENT_DATE()) - YEAR(birthday_at)) YEAR),'%w')
       when 0 then '�����������'
       when 1 then '�����������'
       when 2 then '�������'
       when 3 then '�����'
       when 4 then '�������'
       when 5 then '�������'
       when 6 then '�������' end week_day,
       count(1) `����������`
from users
group by week_day; 


#����������� ������������ ����� � ������� �������

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
  
 