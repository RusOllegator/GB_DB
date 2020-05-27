USE vk;

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT T.gender FROM 
	(SELECT count(1), p.gender FROM 
		likes l JOIN profiles p ON p.user_id = l.user_id 
	 GROUP BY 2
	 ORDER BY 1 DESC) T 
LIMIT 1;