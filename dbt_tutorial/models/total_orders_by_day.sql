select
    ordered_at as date_day,
    count(*) as total_orders
from {{ ref("stg_orders") }}
group by 1
order by 1
