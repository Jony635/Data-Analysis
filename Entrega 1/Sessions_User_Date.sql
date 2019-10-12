select 
date(d.date) as "Date",
ifnull(count(s.session_id) / count(distinct s.player_id), 0) as "Sessions by User"

from dates as d
left join sessions as s on date(s.start) = date(d.date)
left join users as u on u.user_id = s.player_id

group by 1
order by 1