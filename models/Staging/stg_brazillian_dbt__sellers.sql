
with

source as (
    select * from {{ source('brazillian_dbt', 'olist_sellers_dataset') }}
),

renamed as (
    select
        
        seller_id,
        seller_zip_code_prefix,
        LOWER(TRIM(seller_city)) as seller_city,
        LOWER(TRIM(seller_state)) as seller_state

        case seller_city
        when 'sao paulo sp' then 'sao paulo'
        when 'sao pauo' then 'sao paulo'
        when 'sp / sp' then 'sao paulo'
        when 'sao paulo / sao paulo' then 'sao paulo'
        when 'sao paulop' then 'sao paulo'
        when 'sao paulo - sp' then 'sao paulo'
        when 'são paulo' then 'sao paulo'
        when 'sp' then 'sao paulo'
        when 'sao paluo' then 'sao paulo'
        else seller_city
    end as seller_city

    from source
)

select * from renamed
