select 
date(d.date) as "Date",
count(t.transaction_id) as "Number of Transactions"

from dates as d
left join transactions as t on date(t.date) = date(d.date)

group by 1
order by 1