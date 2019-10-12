-- create or replace view PayingUsers as

select 
concat(u.firstName, " ", u.lastName) as "Full Name",
ifnull(sum(t.totalPrice), 0) as "€Spent"

from users as u
left join sessions as s on u.user_id = s.player_id
left join transactions as t on s.session_id = t.session_id

group by u.user_id
order by 2 desc