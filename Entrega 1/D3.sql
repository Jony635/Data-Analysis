select 

date(d.date) as "Date",
-- count(distinct s.player_id) as "People",
-- count(distinct case when s.player_id = _s.player_id and date(_s.start) != date(d.date) then s.player_id end) as "People_Returned",
ifnull((count(distinct case when s.player_id = _s.player_id and date(_s.start) != date(d.date) then s.player_id end) / count(distinct s.player_id) * 100), 0) as "D3"

from dates as d
left join sessions as s on date(d.date) = date(s.start)
left join sessions as _s on date(_s.start) <= date(d.date) and date(_s.start) >= date(d.date) - interval 3 day

group by 1
order by 1