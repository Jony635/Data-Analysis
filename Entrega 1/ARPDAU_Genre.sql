select

date(d.date) as "Date",

case
when u.sex = "M" then ifnull(sum(t.amount * t.totalPrice)/count(distinct s.player_id), 0)
else 0
end as ARPDAU_M,

case
when u.sex = "F" then ifnull(sum(t.amount * t.totalPrice)/count(distinct s.player_id), 0)
else 0
end as ARPDAU_F

from dates as d

left join sessions as s on date(s.start) = date(d.date)
left join transactions as t on s.session_id = t.session_id
left join users as u on u.user_id = s.player_id

group by 1
order by 1 desc