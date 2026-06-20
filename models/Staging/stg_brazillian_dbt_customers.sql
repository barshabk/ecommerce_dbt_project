with

source as (
    select * from {{ source('brazillian_dbt', 'olist_customers_dataset') }}
),

renamed as (
    select
        customer_id,
        customer_unique_id,
        customer_city as customer_city,
        customer_state as customer_state,
        customer_zip_code_prefix

    from source
)

select * from renamed