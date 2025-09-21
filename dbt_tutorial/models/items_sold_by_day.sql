select
    orders.ordered_at as date_day,
    count(*) as items_sold
from {{ ref("stg_order_items") }} as order_items
left join {{ ref("stg_orders") }} as orders
    on order_items.order_id = orders.order_id
group by 1
order by 1
