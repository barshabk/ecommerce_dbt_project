-- stg_brazillian_dbt__sellers.sql
with

source as (
    select * from {{ source('brazillian_dbt', 'olist_sellers_dataset') }}
),

renamed as (
    select
        -- ids
        seller_id,

        -- numerics
        seller_zip_code_prefix,

        -- strings
        LOWER(TRIM(seller_city)) as seller_city,
        LOWER(TRIM(seller_state)) as seller_state

    from source
)

select * from renamed
