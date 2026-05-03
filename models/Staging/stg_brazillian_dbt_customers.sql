
with

source as (
    select * from {{ source('brazillian_dbt', 'olist_customers_dataset') }}
),

renamed as (
    select
        -- ids (strings)
        customer_id,
        customer_unique_id,

        -- strings
        LOWER(TRIM(customer_city)) as customer_city,
        LOWER(TRIM(customer_state)) as customer_state,

        -- numerics (integer)
        customer_zip_code_prefix

    from source
)

select * from renamed