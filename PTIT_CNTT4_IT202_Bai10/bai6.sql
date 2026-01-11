use social_network_pro;
drop view if exists view_users_summary;
create view view_users_summary as
select p.user_id,full_name as username, (select count(*) from bai1.posts u where u.user_id = p.user_id) as total_user_post
from users p;
select user_id,username,total_user_post
from view_users_summary
where total_user_post>5;