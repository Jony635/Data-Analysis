-- create or replace view ARPDAU_Gender as 
select
date(d.date) as "Date",

ifnull(sum(case when u.sex = "M" then (t.totalPrice) end) / count(distinct case when u.sex = "M" then s.player_id end), 0) as "ARPDAU_Men",
ifnull(sum(case when u.sex = "F" then (t.totalPrice) end) / count(distinct case when u.sex = "F" then s.player_id end), 0) as "ARPDAU_Women"

from dates as d

left join sessions as s on date(s.start) = date(d.date)
left join transactions as t on s.session_id = t.session_id
left join users as u on u.user_id = s.player_id

group by 1
order by 1 desc