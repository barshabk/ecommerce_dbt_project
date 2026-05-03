-- stg_brazillian_dbt__orders.sql
with

source as (
    select * from {{ source('brazillian_dbt', 'olist_orders_dataset') }}
),

renamed as (
    select
        -- ids
        order_id,
        customer_id,

        -- strings
        LOWER(TRIM(order_status)) as order_status,

        -- timestamps
        order_purchase_timestamp,
        order_approved_at,
        order_delivered_carrier_date,
        order_delivered_customer_date,
        order_estimated_delivery_date

    from source
)

select * from renamed