use social_network_pro;
drop view if exists view_user_activity_status;
create view view_user_activity_status as select u.user_id,
       u.username,
       u.gender,
       u.created_at,
       case when count(distinct p.post_id) > 0 or count(distinct c.comment_id) > 0
               then 'active'
           else 'inactive'
           end as status
from users u
         left join posts p on u.user_id = p.user_id
         left join comments c on u.user_id = c.user_id
group by
    u.user_id, u.username, u.gender, u.created_at;
select * from view_user_activity_status;
select status,count(*)as total_user from view_user_activity_status
group by status
order by total_user desc ;