select 
date(d.date) as "Date",
ifnull(sum(t.totalPrice) / count(t.transaction_id), 0) as "RevenuePerTransaction"

from dates as d
left join transactions as t on date(t.date) = date(d.date)

group by 1
order by 1