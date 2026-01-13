use social_network_pro;
drop procedure if exists CalculateBonusPoints;
delimiter $$
create procedure CalculateBonusPoints(in p_user_id int,inout p_bonus_points int)
begin
    DECLARE total_post INT DEFAULT 0;
    select count(*) into total_post from posts
        where p_user_id=user_id;
    if total_post >= 20 then
       set p_bonus_points=p_bonus_points+100;
        elseif total_post >=10 then
        set p_bonus_points=p_bonus_points+50;
    end if ;
end $$;
set @bonus=0;
call CalculateBonusPoints(1,@bonus);
select @bonus;