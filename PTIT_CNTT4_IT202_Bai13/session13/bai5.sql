use social_network;
drop procedure if exists add_user;
delimiter $$

create procedure add_user(
    in p_username varchar(50),
    in p_email varchar(100),
    in p_created_at datetime
)
begin
    insert into users(username, email, created_at)
    values (p_username, p_email, p_created_at);
end$$

delimiter ;
drop trigger if exists trg_validate_user;
delimiter $$

create trigger trg_validate_user
before insert on users
for each row
begin
    if new.email not like '%@%.%' then
        signal sqlstate '45000'
        set message_text = 'Email không hợp lệ';
    end if;
    if new.username not regexp '^[a-zA-Z0-9_]+$' then
        signal sqlstate '45000'
        set message_text = 'Username chỉ được chứa chữ cái, số và underscore';
    end if;
end$$

delimiter ;
call add_user('binh_01', 'binhgmail.com', now());
