create or replace view Init as

select 
concat(u.firstName, " ", u.lastName) as "Full Name",
ifnull(sum(t.amount * t.totalPrice), 0) as "€Spent"

from users as u
left join transactions as t on u.user_id = t.player_id

group by u.user_id
order by 2 desc