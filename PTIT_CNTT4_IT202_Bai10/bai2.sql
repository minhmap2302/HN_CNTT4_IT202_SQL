use bai1;
drop view if exists view_user_post;
create view view_user_post as
    select p.user_id,(select count(*) from bai1.posts u where u.user_id= p.user_id) as total_user_post  from bai1.users p;
select * from view_user_post;
select full_name,v.total_user_post from bai1.users u
join view_user_post v on u.user_id=v.user_id;