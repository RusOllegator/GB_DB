USE vk;

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT count(1) AS total, p.gender FROM
likes l JOIN profiles p ON p.user_id = l.user_id
GROUP BY 2
ORDER BY 1 DESC
LIMIT 1;