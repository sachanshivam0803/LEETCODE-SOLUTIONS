# Write your MySQL query statement below
select 
d.name as department,
e.name as employee,
e.salary as salary
from(
    select
    name,
    salary,
    departmentid,
    dense_rank() over (partition by departmentid order by salary desc) as rn
    from employee
) e
join department d on e.departmentid = d.id
where e.rn <=3;