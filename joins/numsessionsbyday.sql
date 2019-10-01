-- create view NumSessionsByDay as

select date(d.date) as Day, count(s.session_id) as "#Sessions"
from dates d
left join sessions s on date(s.start) = date(d.date)

group by d.date
order by 2 DESC