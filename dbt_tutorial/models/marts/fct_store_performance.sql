with orders as (

    select * from {{ ref("stg_jaffle_shop__orders") }}

),

stores as (

    select * from {{ ref("stg_jaffle_shop__stores") }}

),

dates as (

    select * from {{ ref("dates") }}

),


store_performance as (

    select
        store_id,
        ordered_at as date_day,
        count(*) as order_count

    from orders

    group by 1, 2

),

final as (

    select
        dates.date_day,
        stores.store_id,
        stores.store_name,
        coalesce(store_performance.order_count, 0) as order_count

    from dates

    cross join stores

    left join store_performance
        on store_performance.date_day = dates.date_day
        and store_performance.store_id = stores.store_id

)

select * from final
