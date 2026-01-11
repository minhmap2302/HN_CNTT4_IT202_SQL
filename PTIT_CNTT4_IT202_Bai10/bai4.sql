use social_network_pro;
select * from social_network_pro.users;
create index idx_email on users(email);
explain analyze
select * from users
where email='an@gmail.com';
create index idx_created_at_user_id on users(created_at,user_id);
explain analyze
select * from users
where created_at='2026-01-09 16:53:40' and user_id=1;
-- idx_created_at_user_id nhanh hon
drop index idx_email on users;
drop index idx_created_at_user_id on users;