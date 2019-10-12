-- create or replace view ARPPU_Country as

select 
u.country as Country,
sum(t.totalPrice) / count(u.user_id) as ARPPU

from transactions as t
left join sessions as s on s.session_id = t.session_id
left join users as u on u.user_id = s.player_id

group by 1
order by 2 desc