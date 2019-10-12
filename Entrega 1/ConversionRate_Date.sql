select 
date(d.date) as "Date",
ifnull(count(t.transaction_id) / count(u.user_id), 0) as "Conversion Rate"

from dates as d
left join sessions as s on date(s.start) = date(d.date)
left join users as u on u.user_id = s.player_id
left join transactions as t on t.session_id = s.session_id

group by 1
order by 1