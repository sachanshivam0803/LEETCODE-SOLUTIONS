# Write your MySQL query statement below
SELECT 
query_name,
round(avg(rating/position*1.0),2)as quality,
round(sum(case when rating < 3 then 1 else 0 end)*100.0/count(*),2)as poor_query_percentage
from
queries
where 
query_name is not null
group by
query_name;