select 
date(d.date) as "Date",
count(u.user_id) as "New Users"

from dates as d
left join users as u on date(u.dateCreated) = date(d.date)

group by 1
order by 1