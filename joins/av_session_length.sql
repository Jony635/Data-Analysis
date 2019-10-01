create view AvSessionLength as

select concat(u.firstName, " ", u.lastName) as "Name", avg(timestampdiff(SECOND, s.start, s.end))/60 as "Av Session Length (min)"
from users u
left join sessions s on u.user_id = s.player_id

group by u.user_id
order by 2 DESC