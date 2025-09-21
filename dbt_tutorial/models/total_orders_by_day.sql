select
    date(ordered_at) as date_day,
    count(*) as total_orders
from {{ source("jaffle_shop", "orders") }}
group by 1
order by 1
