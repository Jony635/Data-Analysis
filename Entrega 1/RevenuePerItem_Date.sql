select 

date(d.date) as "Date",
ifnull(sum(t.totalPrice) / sum(t.amount), 0) as "Revenue Per Item"

from dates as d
left join transactions as t on date(t.date) = date(d.date)

group by 1
order by 1