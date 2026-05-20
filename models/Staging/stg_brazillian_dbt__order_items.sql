


with

source as (
    select * from {{ source('brazillian_dbt', 'olist_order_items_dataset') }}
),

renamed as (
    select
        -- ids
        order_id,
        order_item_id,
        product_id,
        seller_id,

        -- dates(datetime)
        shipping_limit_date,

        -- numerics(float)
        price,
        freight_value

    from source
)

select * from renamed