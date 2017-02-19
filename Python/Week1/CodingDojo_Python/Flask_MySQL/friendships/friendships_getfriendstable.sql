SELECT users.first_name, users.last_name, friends.first_name AS friend_first_name, friends.last_name AS friend_last_name FROM users
LEFT JOIN friendships ON friendships.user_id=users.id
LEFT JOIN users as friends ON friendships.friend_id=friends.id;