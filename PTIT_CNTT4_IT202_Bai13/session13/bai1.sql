use Social_Network;
drop trigger if exists insert_post;
drop trigger if exists delete_post;
delimiter $$
create trigger insert_post
    after insert
    on posts
    for each row
begin
    update users
    set post_count=post_count + 1
    where user_id = new.user_id;
end $$;
delimiter $$
create trigger delete_post
    after delete
    on posts
    for each row
begin
    update users
    set post_count=post_count - 1
    where user_id = OLD.user_id;
end $$;
select * from users;
INSERT INTO posts (user_id, content, created_at) VALUES

(1, 'Hello world from Alice!', '2025-01-10 10:00:00'),

(1, 'Second post by Alice', '2025-01-10 12:00:00'),

(2, 'Bob first post', '2025-01-11 09:00:00'),

(3, 'Charlie sharing thoughts', '2025-01-12 15:00:00');
select * from users;
delete from posts
where post_id=2;
select * from users;