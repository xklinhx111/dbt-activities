with orders as (

    select * from {{ ref("stg_jaffle_shop__orders") }}

),

order_items as (

    select * from {{ ref("stg_jaffle_shop__order_items") }}

),

stores as (

    select * from {{ ref("stg_jaffle_shop__stores") }}

),

dates as (

    select * from {{ ref("dates") }}

),

order_items_aggregated as (

    select
        order_id,
        count(*) as items_sold

    from order_items

    group by 1

),

store_performance as (

    select
        store_id,
        ordered_at as date_day,
        count(*) as order_count,
        sum(order_items_aggregated.items_sold) as items_sold,
        sum(total_amount) as revenue

    from orders

    left join order_items_aggregated on
        orders.order_id = order_items_aggregated.order_id

    group by 1, 2

),

final as (

    select
        dates.date_day,
        stores.store_id,
        stores.store_name,
        coalesce(store_performance.order_count, 0) as order_count,
        coalesce(store_performance.items_sold, 0) as items_sold,
        coalesce(store_performance.revenue, 0) as revenue

    from dates

    cross join stores

    left join store_performance
        on store_performance.date_day = dates.date_day
        and store_performance.store_id = stores.store_id

)

select * from final
