select 
date(d.date) as "Date",
count(distinct case when u.sex = "M" then s.player_id end) as "DAU_Men",
count(distinct case when u.sex = "F" then s.player_id end) as "DAU_Women"

from dates as d
left join sessions as s on date(s.start) = date(d.date)
left join users as u on u.user_id = s.player_id

group by 1
order by 1