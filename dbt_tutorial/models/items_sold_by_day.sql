select
    date(orders.ordered_at) as date_day,
    count(*) as total_items
from {{ source("jaffle_shop", "items") }} as items
left join {{ source("jaffle_shop", "orders") }} as orders
    on items.order_id = orders.id
group by 1
order by 1
