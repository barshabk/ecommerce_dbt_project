with

source as (
    select * from {{ source('brazillian_dbt', 'olist_geolocation_dataset') }}
),

deduplicated as (
    select *,
        ROW_NUMBER() OVER (
            PARTITION BY geolocation_zip_code_prefix
            ORDER BY geolocation_city
        ) as row_num
    from source
),

renamed as (
    select
        geolocation_zip_code_prefix,
        geolocation_lat as latitude,
        geolocation_lng as longitude,
        geolocation_city as geolocation_city,
        geolocation_state as geolocation_state
    from deduplicated
    where row_num = 1
)

select * from renamed