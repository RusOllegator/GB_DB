USE vk;

-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети (критерии активности необходимо определить самостоятельно).

/*
Критерий активности - количество друзей, лайков, постов, медиафайлов, сообщений, сообществ, в которых состоит пользователь.
Сущности связанные с пользователем имеют разный вес:
лайк - 1
сообщение - 2
друзья - 4
сообщества - 4
файл - 5
пост - 10 
*/

SELECT 
	id user_id,
	(SELECT count(1) FROM users u1 JOIN likes l ON l.user_id = u1.id where u1.id = u.id)  -- Определяем вес лайков для каждого пользователя
	+
	(SELECT count(1) * 2 FROM users u2 JOIN messages m ON m.from_user_id = u2.id where u2.id = u.id) -- вес сообщений
	+
	(SELECT count(1) * 4 FROM users u3 JOIN friendship f ON f.user_id = u3.id where u3.id = u.id) -- вес дружеских связей
    +
    (SELECT count(1) * 4 FROM users u4 JOIN communities_users cu ON cu.user_id = u4.id where u4.id = u.id) -- вес сообществ
	+
	(SELECT count(1) * 5 FROM users u5 JOIN media me ON me.user_id = u5.id where u5.id = u.id) -- вес медиа контента
	+
	(SELECT count(1) * 5 FROM users u6 JOIN posts p ON p.user_id = u6.id where u6.id = u.id) -- вес постов
	as ACTIVE_RATE
FROM users u
ORDER BY 2 LIMIT 10; 