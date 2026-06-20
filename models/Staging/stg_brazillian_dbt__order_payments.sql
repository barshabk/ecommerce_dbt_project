with

source as (
    select * from {{ source('brazillian_dbt', 'olist_order_payments_dataset') }}
),

renamed as (
    select
        order_id,
        payment_sequential,
        payment_installments,
        payment_value,
        LOWER(TRIM(payment_type)) as payment_type

    from source
)

select * from renamed