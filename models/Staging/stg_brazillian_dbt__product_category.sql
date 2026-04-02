-- stg_brazillian_dbt__product_category.sql
with

source as (
    select * from {{ source('brazillian_dbt', 'product_category_name_translation') }}
),

renamed as (
    select
        -- strings
        LOWER(TRIM(product_category_name)) as product_category_name,
        LOWER(TRIM(product_category_name_english)) as product_category_name_english

    from source
)

select * from renamed