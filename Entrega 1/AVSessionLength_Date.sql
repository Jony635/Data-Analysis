select 
date(d.date) as "Date",
ifnull(minute(avg(s.lastControl - s.start)), 0) as "AV Session Length"

from dates as d
left join sessions as s on date(s.start) = date(d.date)

group by 1
order by 1