select
    id as order_id,
    store_id,
    customer as customer_id,
    date(ordered_at) as ordered_at,
    subtotal as net_amount,
    tax_paid as tax_amount,
    order_total as total_amount
from {{ source('jaffle_shop', 'orders') }}
