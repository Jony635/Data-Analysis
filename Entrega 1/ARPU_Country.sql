-- create or replace view ARPU_Country as

select 
u.country as Country,
sum(t.totalPrice) / count(u.user_id) as ARPU

from users as u
left join sessions as s on s.player_id = u.user_id
left join transactions as t on t.session_id = s.session_id

group by 1
order by 2 desc