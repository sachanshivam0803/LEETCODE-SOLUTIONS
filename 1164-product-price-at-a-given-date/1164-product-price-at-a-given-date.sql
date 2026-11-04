# Write your MySQL query statement below
select p.product_id,
coalesce(latest_prices.new_price, 10) as price
from(
    select distinct product_id
    from Products
) p
left join (
    select product_id, new_price,
    rank() over (partition by product_id order by change_date desc) as rnk
    from Products
    where change_date <= '2019-08-16'
) latest_prices on p.product_id = latest_prices.product_id and latest_prices.rnk = 1;