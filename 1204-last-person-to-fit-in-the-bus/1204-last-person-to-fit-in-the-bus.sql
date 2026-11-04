# Write your MySQL query statement below
select person_name
from(
select person_name,
sum(weight) over (order by turn) as cumulative_weight
from Queue
) t
where cumulative_weight <=1000
order by cumulative_weight desc
limit 1;