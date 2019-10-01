-- create view MAU as

-- FINISH THIS SHIT

select d.date as "Day", count(distinct s.player_id) as "MAU", count(s.player_id) as "Not Unique"
from dates d
left join sessions s on date(s.start) > date(d.date - interval 30 day) and date(s.start) <= date(d.date)

group by 1
order by 2 DESC