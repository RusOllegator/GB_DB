/*
 Создайте двух пользователей которые имеют доступ к базе данных shop.
 Первому пользователю shop_read должны быть доступны только запросы на чтение данных, второму пользователю shop — любые операции в пределах базы данных shop.
*/

CREATE USER IF NOT EXISTS shop_read IDENTIFIED WITH sha256_password BY 'shop_read';

GRANT SELECT ON shop.* TO shop_read;

CREATE USER IF NOT EXISTS shop IDENTIFIED WITH sha256_password BY 'shop' ;

GRANT ALL ON shop.* TO shop;
