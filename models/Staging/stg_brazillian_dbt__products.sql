-- stg_brazillian_dbt__products.sql
with

source as (
    select * from {{ source('brazillian_dbt', 'olist_products_dataset') }}
),

renamed as (
    select
        -- ids
        product_id,

        -- strings
        LOWER(TRIM(product_category_name)) as product_category_name,

        -- numerics
        product_name_lenght as product_name_length,
        product_description_lenght as product_description_length,
        product_photos_qty,
        product_weight_g,
        product_length_cm,
        product_height_cm,
        product_width_cm

    from source
)

select * from renamed