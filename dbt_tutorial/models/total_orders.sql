select count(*) as total_orders
from {{ ref("stg_orders") }}
