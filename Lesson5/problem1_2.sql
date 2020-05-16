CREATE database lesson5;
use lesson5;

#����� � ������� users ���� created_at � updated_at ��������� ��������������. ��������� �� �������� ����� � ��������.

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

 UPDATE users 
 set created_at =  IF ( created_at is NULL , date_format(NOW() ,'%d.%m.%Y %H:%i'),created_at ),
	 updated_at = IF ( updated_at is NULL , date_format(NOW() ,'%d.%m.%Y %H:%i') , updated_at );

# select * from users;

/*������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ ����� VARCHAR � � ��� ������ ����� ���������� �������� � ������� "20.10.2017 8:10".
 ���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������. */

UPDATE users SET created_at = STR_TO_DATE(created_at,'%d.%m.%Y %H:%i'),
	   updated_at = STR_TO_DATE(updated_at,'%d.%m.%Y %H:%i'); 

/*��� ������ ����� commit, ��� ���������� ��� ������� �� ������������*/
	  
alter table users modify created_at datetime;
alter table users modify updated_at datetime;



 