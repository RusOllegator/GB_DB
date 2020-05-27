USE vk;

-- Подсчитать общее количество лайков десяти самым молодым пользователям (сколько лайков получили 10 самых молодых пользователей).


SELECT count(1) FROM 
	likes l 
	JOIN
	(SELECT u.id, p.birthday from 
		users u
		JOIN profiles p ON u.id = p.user_id
		ORDER BY 2 DESC
		LIMIT 10) u1
	ON l.target_id = u1.id;