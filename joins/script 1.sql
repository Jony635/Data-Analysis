select concat(u.firstName, " ", u.lastName) as "Name", ifnull(sum(t.totalPrice), 0) as "TotalPrice"
from users u
left join transactions t on u.user_id = t.player_id

group by u.user_id
order by 2 DESC

