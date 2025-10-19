select
    sku as product_id,
    name as product_name,
    type as product_type,
    description as product_description,
    price as product_price,
    coalesce(type = 'jaffle', false) as is_food_item,
    coalesce(type = 'beverage', false) as is_drink_item
from {{ source('jaffle_shop', 'products') }}
