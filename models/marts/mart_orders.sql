with orders as (
    select * from {{ ref('stg_brazillian_dbt__orders') }}
),

customers as (
    select * from {{ ref('stg_brazillian_dbt_customers') }}
)


    SELECT 
        orders.order_id,
        orders.customer_id,
        orders.order_status,
        orders.order_purchase_timestamp,
        orders.order_delivered_carrier_date,
        orders.order_delivered_customer_date,
        orders.order_estimated_delivery_date,
        customers.customer_city,
        customers.customer_state,
        customers.customer_zip_code_prefix,
    FROM orders
    JOIN customers
        on orders.customer_id = customers.customer_id

