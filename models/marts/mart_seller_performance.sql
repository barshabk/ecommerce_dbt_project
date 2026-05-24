with order_items as (
    select * from {{ ref('stg_brazillian_dbt__order_items') }}
),

orders as (
    select * from {{ ref('stg_brazillian_dbt__orders') }}
),

reviews as (
    select * from {{ ref('stg_brazillian_dbt__order_reviews') }}
)

select
    order_items.order_id,
    order_items.seller_id,
    order_items.product_id,
    order_items.price,
    orders.order_status,
    orders.order_delivered_customer_date,
    orders.order_estimated_delivery_date,
    reviews.review_score
from order_items
join orders
    on order_items.order_id = orders.order_id
join reviews
    on order_items.order_id = reviews.order_id