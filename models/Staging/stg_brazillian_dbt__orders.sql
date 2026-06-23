with

source as (
    select * from {{ source('brazillian_dbt', 'olist_orders_dataset') }}
),

renamed as (
    select
        order_id,
        customer_id,
        order_status,
        FORMAT_DATE('%m-%d-%Y', DATE (order_purchase_timestamp)) as order_purchase_date,
        order_purchase_timestamp,
        order_approved_at,
        order_delivered_carrier_date,
        order_delivered_customer_date,
        FORMAT_DATE('%m-%d-%Y', DATE(order_estimated_delivery_date)) as order_estimated_delivery_date

    from source
)

select * from renamed

