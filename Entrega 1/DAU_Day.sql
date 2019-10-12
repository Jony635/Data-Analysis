create or replace view DAU as

select 
date(d.date) as "Date",
count(distinct s.player_id) as "Distinct Active Users"

from dates as d
left join sessions as s on date(s.start) = date(d.date)

group by 1
order by 1