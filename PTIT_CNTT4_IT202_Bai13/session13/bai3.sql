use social_network;
drop trigger if exists insert_post;
drop trigger if exists delete_post;

delimiter $$

create trigger insert_post
after insert on posts
for each row
begin
    update users
    set post_count = post_count + 1
    where user_id = new.user_id;
end$$

create trigger delete_post
after delete on posts
for each row
begin
    update users
    set post_count = post_count - 1
    where user_id = old.user_id;
end$$
drop trigger if exists trg_prevent_self_like;

create trigger trg_prevent_self_like
before insert on likes
for each row
begin
    declare post_owner int;
    select user_id into post_owner
    from posts
    where post_id = new.post_id;

    if post_owner = new.user_id then
        signal sqlstate '45000'
        set message_text = 'Không được like bài viết của chính mình';
    end if;
end$$
drop trigger if exists countlike;
drop trigger if exists unlike;
drop trigger if exists update_like;

create trigger countlike
after insert on likes
for each row
begin
    update posts
    set like_count = like_count + 1
    where post_id = new.post_id;
end$$

create trigger unlike
after delete on likes
for each row
begin
    update posts
    set like_count = like_count - 1
    where post_id = old.post_id;
end$$

create trigger update_like
after update on likes
for each row
begin
    update posts
    set like_count = like_count - 1
    where post_id = old.post_id;

    update posts
    set like_count = like_count + 1
    where post_id = new.post_id;
end$$

delimiter ;
insert into likes(user_id, post_id)
values (1, 1);
