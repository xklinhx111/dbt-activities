select
    id as order_id,
    store_id,
    customer as customer_id,
    date(ordered_at) as ordered_at,
    subtotal,
    tax_paid,
    order_total
from {{ source('jaffle_shop', 'orders') }}
