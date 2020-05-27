USE vk;

show CREATE table media;

/*
communities
communities_users
friendship
friendship_statuses
likes
media
media_types
messages
posts
profiles
target_types
user_statuses
users
 */

-- select * from communities; 

-- Создать все необходимые внешние ключи и диаграмму отношений.

ALTER TABLE communities_users
	ADD CONSTRAINT communities_id_fk FOREIGN KEY (community_id) REFERENCES communities (id)
	ON DELETE CASCADE,
	ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users (id)
	ON DELETE CASCADE;


ALTER TABLE friendship
	ADD CONSTRAINT friendship_status_fk FOREIGN KEY (status_id) REFERENCES friendship_statuses (id)
	ON DELETE CASCADE,
	ADD CONSTRAINT friendship_user_id_fk FOREIGN KEY (user_id) REFERENCES users (id)
	ON DELETE CASCADE,
	ADD CONSTRAINT friendship_friend_id_fk FOREIGN KEY (friend_id) REFERENCES users (id)
	ON DELETE CASCADE;

-- ALTER TABLE likes DROP FOREIGN KEY likes_target_type_id;
-- ALTER TABLE likes DROP FOREIGN KEY likes_user_id_fk;
ALTER TABLE likes
	ADD CONSTRAINT likes_user_id_fk FOREIGN KEY (user_id) REFERENCES users (id)
	ON DELETE CASCADE,
	ADD CONSTRAINT likes_target_type_id FOREIGN KEY (target_type_id) REFERENCES target_types (id)
	ON DELETE RESTRICT;
	
ALTER TABLE messages 
	ADD CONSTRAINT messages_from_user_id_fk FOREIGN KEY (from_user_id) REFERENCES users (id)
	ON DELETE CASCADE,
	ADD CONSTRAINT messages_to_user_id_fk FOREIGN KEY (to_user_id) REFERENCES users (id)
	ON DELETE CASCADE;
	

ALTER TABLE posts 
	ADD CONSTRAINT posts_user_id_fk FOREIGN KEY (user_id) REFERENCES users (id)
	ON DELETE CASCADE,
	ADD CONSTRAINT posts_community_id_fk FOREIGN KEY (community_id) REFERENCES communities (id)
	ON DELETE SET NULL,
	ADD CONSTRAINT posts_media_id_fk FOREIGN KEY (media_id) REFERENCES media (id)
	ON DELETE SET NULL;


ALTER TABLE  media
	ADD CONSTRAINT media_user_id_fk FOREIGN KEY (user_id) REFERENCES users (id)
	ON DELETE CASCADE,
	ADD CONSTRAINT media_type_id_fk FOREIGN KEY (media_type_id) REFERENCES media_types (id)
	ON DELETE RESTRICT;
