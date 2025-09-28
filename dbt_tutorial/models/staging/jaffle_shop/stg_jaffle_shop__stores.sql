select
    id as store_id,
    name as store_name,
    tax_rate,
    date(opened_at) as opened_at
from {{ source('jaffle_shop', 'stores') }}
