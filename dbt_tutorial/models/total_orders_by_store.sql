select
    stores.store_id,
    stores.store_name,
    count(orders.order_id) as total_orders
from {{ ref("stg_stores") }} as stores
left join {{ ref("stg_orders") }} as orders
    on stores.store_id = orders.store_id
group by 1, 2
order by 3 desc
