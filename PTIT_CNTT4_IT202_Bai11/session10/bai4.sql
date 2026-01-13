use social_network_pro;
drop procedure if exists CreatePostWithValidation;
delimiter $$
create procedure CreatePostWithValidation(in p_user_id int, in p_context varchar(255), out result varchar(255))
    if char_length(p_context) < 5 then
        set result = 'Nội dung quá ngắn';
    else
        insert into posts(user_id, content, created_at)
        values
            (p_user_id,p_context,now());
        set result = 'Thêm bài viết thành công';
    end if $$;

set @bonus='';
#1
call CreatePostWithValidation(1,'coca',@bonus);
select @bonus;
#2
call CreatePostWithValidation(1,'cocacola',@bonus);
select @bonus;