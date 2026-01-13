use social_network_pro;
delimiter $$

create procedure notifyfriendsonnewpost(
    in p_user_id int,
    in p_content text
)
begin
    declare poster_name varchar(255);
    select full_name
    into poster_name
    from users
    where user_id = p_user_id;
    insert into posts(user_id, content, created_at)
    values (p_user_id, p_content, now());
    insert into notifications(user_id, type, content, created_at)
    select
        f.friend_id,
        'new_post',
        concat(poster_name, ' đã đăng một bài viết mới'),
        now()
    from friends f
    where f.user_id = p_user_id
      and f.status = 'accepted'
      and f.friend_id <> p_user_id;
    insert into notifications(user_id, type, content, created_at)
    select
        f.user_id,
        'new_post',
        concat(poster_name, ' đã đăng một bài viết mới'),
        now()
    from friends f
    where f.friend_id = p_user_id
      and f.status = 'accepted'
      and f.user_id <> p_user_id;
end $$
delimiter ;
