with

source as (
    select * from {{ source('brazillian_dbt', 'product_category_name_translation') }}
),

renamed as (
    select
        product_category_name as product_category_name,
        product_category_name_english) as product_category_name_english

    from source
)

select * from renamed