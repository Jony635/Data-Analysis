-- create or replace view ARPDAU as 
select
date(d.date) as "Date",
ifnull(sum(t.totalPrice)/count(distinct s.player_id), 0) as "ARPDAU"
from dates as d

left join sessions as s on date(s.start) = date(d.date)
left join transactions as t on s.session_id = t.session_id

group by 1
order by 2 desc