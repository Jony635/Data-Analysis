select 

date(d.date) as "Date"

from dates as d
left join sessions as s on date(s.start) = date(d.date)
left join sessions as _s on date(_s.start) = date(d.date) - interval 1 day

group by 1
order by 1