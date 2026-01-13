use social_network_pro;
delimiter $$

create procedure calculateuseractivityscore(
    in iduser int,
    out activity_score int,
    out activity_level varchar(50)
)
begin
    declare totalpost int default 0;
    declare totallike int default 0;
    declare totalcom int default 0;

    select count(*)
    into totalpost
    from posts
    where user_id = iduser;

    select count(*)
    into totallike
    from likes l
    join posts p on l.post_id = p.post_id
    where p.user_id = iduser;

    select count(*)
    into totalcom
    from comments c
    join posts p on c.post_id = p.post_id
    where p.user_id = iduser;

    set activity_score = totalpost * 10 + totallike * 3 + totalcom * 5;

    if activity_score >= 500 then
        set activity_level = 'Rất tích cực';
    elseif activity_score >= 200 then
        set activity_level = 'tích cực';
    else
        set activity_level = 'Bình thường';
    end if;
end $$
set @score=0;
set @result='';
call calculateuseractivityscore(1,@score,@result);
select @score,@result;
