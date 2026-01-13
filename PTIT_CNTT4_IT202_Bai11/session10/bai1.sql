use social_network_pro;
DROP PROCEDURE IF EXISTS laybaivietcuanguoidung;
delimiter $$
create procedure laybaivietcuanguoidung(in p_user_id int)
begin
    select * from social_network_pro.posts
        where user_id=p_user_id;
end $$
    call laybaivietcuanguoidung(1);
