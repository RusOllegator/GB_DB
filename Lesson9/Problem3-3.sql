/*
Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел.
Вызов функции FIBONACCI(10) должен возвращать число 55.
*/

USE shop;

DROP FUNCTION FIBONACCI;

DELIMITER //

CREATE FUNCTION FIBONACCI ( N BIGINT UNSIGNED)
RETURNS BIGINT UNSIGNED DETERMINISTIC
BEGIN
	
	DECLARE I BIGINT UNSIGNED DEFAULT 1;
	DECLARE First_n BIGINT UNSIGNED DEFAULT 0;
	DECLARE Second_n BIGINT UNSIGNED DEFAULT 1;
	DECLARE Febonacci_n BIGINT UNSIGNED DEFAULT 0;
	
	IF N = 0 THEN
		RETURN 0;
	ELSEIF N = 1 THEN
		RETURN 1;
	ELSE
		WHILE I < N DO
		
			SET Febonacci_n = First_n + Second_n;
			SET First_n = Second_n;
			SET Second_n = Febonacci_n;
			SET I = I+1;
		END WHILE;
		RETURN Febonacci_n;
	END IF;

END

DELIMITER ;
