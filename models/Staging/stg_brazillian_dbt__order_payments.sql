-- stg_brazillian_dbt__order_payments.sql
with

source as (
    select * from {{ source('brazillian_dbt', 'olist_order_payments_dataset') }}
),

renamed as (
    select
        -- ids
        order_id,

        -- numerics
        payment_sequential,
        payment_installments,
        payment_value,

        -- strings
        LOWER(TRIM(payment_type)) as payment_type

    from source
)

select * from renamed