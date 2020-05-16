/*
  � ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 0, ���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. 
  ���������� ������������� ������ ����� �������, ����� ��� ���������� � ������� ���������� �������� value. ������, ������� ������ ������ ���������� � �����, ����� ���� �������.
 */

CREATE database IF NOT EXISTS lesson5;
USE lesson5;

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT '����� �������� ������� �� ������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '������ �� ������';

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
