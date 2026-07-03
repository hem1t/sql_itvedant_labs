create database SocialMedia;
use SocialMedia;
-- Accounts
CREATE TABLE User (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(128) UNIQUE,
    email VARCHAR(128) UNIQUE
);
-- Post
CREATE TABLE Post (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id)
        REFERENCES User (id)
);
-- Likes
CREATE TABLE Likes (
    user_id INT,
    FOREIGN KEY (user_id)
        REFERENCES User (id),
    post_id INT,
    FOREIGN KEY (post_id)
        REFERENCES Post (id)
);



CREATE TABLE Post (
    user_id INT,
    post_id INT UNIQUE,
    likes INT
);
drop table Post;

Insert into Post(user_id, post_id, likes) values
(1, 1, 30), (2, 2, 55), (3, 3, 60),
(1, 4, 10), (2, 5, 25), (3, 6, 10),
(1, 7, 15), (2, 8, 45), (3, 9, 9);

select 
	user_id, post_id, likes,
	sum(likes) Over(partition by user_id) as TotalLikes
from Post;