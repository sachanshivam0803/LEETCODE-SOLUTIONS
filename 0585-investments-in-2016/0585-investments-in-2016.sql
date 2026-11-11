# Write your MySQL query statement below
select round(sum(tiv_2016),2) as tiv_2016
from(
    select tiv_2016,
    count(*) over (partition by tiv_2015) as tiv_2015_count,
    count(*) over (partition by lat,lon) as loc_count
    from insurance
) as sub
where tiv_2015_count > 1
and loc_count = 1;