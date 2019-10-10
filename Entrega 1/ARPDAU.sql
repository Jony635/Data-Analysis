select
	temp_a.Date as "Date",
	ifnull(avg(temp_a.€Spent / temp_a.Distinct_Amount_Players), 0) as "ARPDAU" -- Average Revenue Per Daily Active User
from
(
    select
	date(d.date) as "Date",
	count(distinct s.player_id) as "Distinct_Amount_Players",
	ifnull(sum(t.amount * t.totalPrice), 0) as "€Spent"
	from dates as d
    
    left join sessions as s on date(s.start) = date(d.date)
	left join transactions as t on s.session_id = t.session_id
    
    group by 1
	order by 2 desc
    
) as temp_a

group by 1
order by 2 desc