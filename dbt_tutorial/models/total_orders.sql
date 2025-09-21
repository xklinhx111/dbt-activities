select count(*) as total_orders
from {{ source("jaffle_shop", "orders") }}
