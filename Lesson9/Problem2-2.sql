/*
Пусть имеется таблица accounts содержащая три столбца id, name, password, содержащие первичный ключ, имя пользователя и его пароль.
Создайте представление username таблицы accounts, предоставляющий доступ к столбца id и name. 
Создайте пользователя user_read, который бы не имел доступа к таблице accounts, однако, мог бы извлекать записи из представления username.
*/

USE shop;

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE,
	password VARCHAR(250)
);
	

INSERT INTO `accounts` VALUES ('1','aspernatur','5fee87231ff96fe46b79816071a5cd1428a000a2'),
('2','blanditiis','24bdfac97c437f490bdac331cb49920399fb6345'),
('3','cupiditate','3de355c749c6197f3337bc2a03480d4c64ad9b1b'),
('4','aliquam','c97dbe2731fb174ad40fa43bb73b4fbb22bb035d'),
('5','illum','4e33faa59a2d63062821c1ab1ad6d6e3943fe178'),
('6','praesentium','7e6095610a90e84d24e7459743cd39b807768d54'),
('7','ducimus','cbc446adde838f2f76d0be5ef8d03faaa948dedb'),
('8','qui','06312e4fe467a1b04ee2e6524647dc09422f1865'),
('9','enim','6c1b3b6db13d767c6f3f6ed6bd221cd3512d69e6'),
('10','a','3e26cdf9e5892071867d92b8158089dc182d461e'),
('11','ipsum','e40d866f595a0a392f55d00bff038825517d5135'),
('12','velit','3e06d4328214c9df9220a6f23294285f78bf3cfe'),
('13','repellendus','036a654935ddec733ff9fb7132f5468675c3bc10'),
('14','minima','7636349ecfacef5acb8451d6be980ddf3cb31931'),
('15','rerum','754f7910ad6b27f4c5bd656abb537018864242ee');  

CREATE OR REPLACE VIEW username_v  AS
SELECT id, name from accounts;

CREATE USER user_read IDENTIFIED WITH sha256_password BY 'user_read';

GRANT SELECT ON username_v TO user_read;