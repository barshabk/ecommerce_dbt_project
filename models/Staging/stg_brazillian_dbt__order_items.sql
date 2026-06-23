with

source as (
    select * from {{ source('brazillian_dbt', 'olist_order_items_dataset') }}
),

renamed as (
    select
        order_id,
        order_item_id,
        product_id,
        seller_id,
        FORMAT_DATE('%m-%d-%Y', DATE (shipping_limit_date)) as shipping_limit_date,
        shipping_limit_date as shipping_limit_timestamp,
        price,
        freight_value

    from source
)

select * from renamed