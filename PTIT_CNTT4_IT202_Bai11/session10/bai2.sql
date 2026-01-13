use social_network_pro;
drop procedure if exists CalculatePostLikes;
delimiter $$
create procedure CalculatePostLikes(in p_userid_post int,
                                    out total_like int)
begin
    select * from social_network_pro.posts
        where post_id=p_userid_post;
    select count(*) into total_like from social_network_pro.likes
        where post_id=p_userid_post;
end $$;
call CalculatePostLikes(1,@total);
select @total;