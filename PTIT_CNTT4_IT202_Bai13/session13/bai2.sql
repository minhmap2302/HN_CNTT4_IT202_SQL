use social_network;
create table if not exists likes
(
    like_id  INT AUTO_INCREMENT PRIMARY KEY,
    user_id  INT,
    post_id  INT,
    liked_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (post_id) REFERENCES posts (post_id)
);
INSERT INTO likes (user_id, post_id, liked_at)
VALUES (2, 1, '2025-01-10 11:00:00'),

       (3, 1, '2025-01-10 13:00:00'),

       (1, 3, '2025-01-11 10:00:00'),

       (3, 4, '2025-01-12 16:00:00');
delimiter $$
create trigger if not exists countlike
    after insert
    on likes
    for each row
begin
    update posts
    set like_count=like_count + 1
    where post_id = NEW.post_id;
end $$;
delimiter $$
create trigger if not exists unlike
    after delete
    on likes
    for each row
begin
    update posts
    set like_count=like_count - 1
    where post_id = OLD.post_id;
end $$;
select *
from posts;
delete
from likes
where like_id = 3;
drop view if exists user_statistics;
create view user_statistics as
select
    p.user_id,
    u.username,
    u.post_count,
    sum(p.like_count) as total_like
from posts p
join users u on p.user_id = u.user_id
group by p.user_id, u.username, u.post_count;
select * from user_statistics;