select
date(d.date) as "Date",
count(session_id) as "SessionCount"

from dates as d
left join sessions as s on date(s.start) = date(d.date)

group by 1
order by 1