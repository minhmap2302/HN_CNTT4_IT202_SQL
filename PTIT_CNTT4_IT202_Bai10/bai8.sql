use social_network_pro;
drop view if exists view_popular_posts;
create view view_popular_posts as
select p.post_id,
       u.full_name,
       p.content,
       count(distinct l.user_id) as total_like,
       count(distinct c.post_id) as comment
from posts p
         left join users u on u.user_id = p.user_id
         left join comments c on u.user_id = p.user_id
         left join likes l on p.post_id = l.post_id
group by p.post_id, u.full_name, p.content;
select * from view_popular_posts;
select * from view_popular_posts
where total_like+comment>10
order by total_like+comment desc;