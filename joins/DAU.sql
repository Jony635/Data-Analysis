create view DAU as

select date(d.date) as Day, count(distinct s.player_id) as "DAU", count(s.player_id) as "Not Unique"
from dates d
left join sessions s on date(s.start) = date(d.date)

group by d.date
order by 2 DESC