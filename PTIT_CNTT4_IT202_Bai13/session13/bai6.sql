use social_network;
use social_network;

create table if not exists followers
(
    follower_id INT,
    followee_id INT,
    status      ENUM ('pending', 'accepted') default 'accepted',
    primary key (follower_id, followee_id),
    foreign key (follower_id)
        references users (user_id),
    foreign key (followee_id)
        references users (user_id)
);
drop trigger if exists trg_prevent_self_follow;
delimiter $$

create trigger trg_prevent_self_follow
before insert on followers
for each row
begin
    if new.follower_id = new.followee_id then
        signal sqlstate '45000'
        set message_text = 'Không được theo dõi chính mình';
    end if;
end$$

delimiter ;
drop trigger if exists trg_friendship_after_insert;
delimiter $$

create trigger trg_friendship_after_insert
after insert on followers
for each row
begin
    if new.status = 'accepted' then
        update users
        set follower_count = follower_count + 1
        where user_id = new.followee_id;
    end if;
end$$

delimiter ;
drop trigger if exists trg_friendship_after_delete;
delimiter $$

create trigger trg_friendship_after_delete
after delete on followers
for each row
begin
    if old.status = 'accepted' then
        update users
        set follower_count = follower_count - 1
        where user_id = old.followee_id;
    end if;
end$$

delimiter ;
