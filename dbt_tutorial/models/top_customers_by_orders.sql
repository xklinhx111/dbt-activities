select
    customers.id as customer_id,
    customers.name as customers_name,
    count(*) as total_orders
from {{ source("jaffle_shop", "orders") }} as orders
left join {{ source("jaffle_shop", "customers") }} as customers
    on orders.customer = customers.id
group by 1, 2
order by 3 desc
limit 10

