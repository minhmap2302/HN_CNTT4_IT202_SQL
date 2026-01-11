use social_network_pro;
create index idx_hometown on users(hometown);
SELECT
    u.username,
    p.post_id,
    p.content
FROM users u
JOIN posts p ON u.user_id = p.user_id
WHERE u.hometown = 'Hà Nội'
ORDER BY u.username DESC
LIMIT 10;

explain analyze
select * from users;