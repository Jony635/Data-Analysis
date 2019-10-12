-- CALCULATE STICKINESS
select
date(d.date) as "Date",
ifnull(MAU.DAU / MAU.MAU, 0) as "Stickiness"
from dates as d 
left join
(
	-- CALCULATE MAU
	select
	DAU.Date as "Date",
	DAU.DAU as "DAU",
	count(distinct s.player_id) as "MAU"

	from
	(
		-- CALCULATE DAU

		select 
		date(d.date) as "Date",
		count(distinct s.player_id) as "DAU"

		from dates as d
		left join sessions as s on date(s.start) = date(d.date)

		group by 1
		order by 2 desc
		
	) as DAU

	left join sessions as s on date(s.start) < date(DAU.Date) and date(s.start) > date(DAU.Date) - interval 1 month

	group by 1
	order by 1
    
) as MAU on date(MAU.Date) = date(d.date)