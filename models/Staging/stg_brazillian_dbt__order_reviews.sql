-- stg_brazillian_dbt__order_reviews.sql
with

source as (
    select * from {{ source('brazillian_dbt', 'olist_order_reviews_dataset') }}
),

renamed as (
    select
        -- ids
        review_id,
        order_id,

        -- numerics
        review_score,

        -- strings
        LOWER(TRIM(review_comment_title)) as review_comment_title,
        LOWER(TRIM(review_comment_message)) as review_comment_message,

        -- timestamps
        review_creation_date,
        review_answer_timestamp

    from source
)

select * from renamed