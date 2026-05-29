with order_items as (
    select * from {{ ref('stg_brazillian_dbt__order_items') }}
),

products as (
    select * from {{ ref('stg_brazillian_dbt__products') }}
),

reviews as (
    select * from {{ ref('stg_brazillian_dbt__order_reviews') }}
)

select
    order_items.order_id,
    order_items.product_id,
    order_items.seller_id,
    order_items.price,
    products.product_category_name,
    reviews.review_score
    case 
        when reviews.review_score = 5 then 1 else 0
    end as top_rated
from order_items
join products
    on order_items.product_id = products.product_id
join reviews
    on order_items.order_id = reviews.order_id