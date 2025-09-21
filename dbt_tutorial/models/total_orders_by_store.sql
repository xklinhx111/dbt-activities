select
    stores.id as store_id,
    stores.name as store_name,
    count(orders.id) as total_orders
from {{ source("jaffle_shop", "stores") }} as stores
left join {{ source("jaffle_shop", "orders") }} as orders
    on stores.id = orders.store_id
group by 1, 2
order by 3 desc
