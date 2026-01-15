use social_network;
create table if not exists post_history
(
    history_id         INT AUTO_INCREMENT PRIMARY KEY,
    post_id            INT,
    old_content        TEXT,
    new_content        TEXT,
    changed_at         DATETIME,
    changed_by_user_id INT,
    foreign key (post_id)
        references posts (post_id)
);
delimiter $$
create trigger update_post
    before update
    on posts
    for each row
begin
insert into post_history (
    post_id,
    old_content,
    new_content,
    changed_at,
    changed_by_user_id
)
values
(OLD.post_id,
 OLD.content,
 NEW.content,
 now(),
 OLD.user_id);
end $$;
update posts
set content='1234'
where user_id=1;
select *from post_history;
