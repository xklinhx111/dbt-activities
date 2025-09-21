select
    customers.customer_id,
    customers.customer_name,
    count(*) as total_orders
from {{ ref("stg_orders") }} as orders
left join {{ ref("stg_customers") }} as customers
    on orders.customer_id = customers.customer_id
group by 1, 2
order by 3 desc
limit 10

