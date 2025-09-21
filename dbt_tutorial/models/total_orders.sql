select count(*) as total_orders
from {{ ref("stg_jaffle_shop__orders") }}
