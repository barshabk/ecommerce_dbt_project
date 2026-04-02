
with

source as (
    select * from {{ source('brazillian_dbt', 'olist_geolocation_dataset') }}
),

renamed as (
    select
        -- ids(int)
        geolocation_zip_code_prefix,

        -- numerics(float)
        geolocation_lat,
        geolocation_lng,

        -- strings
        LOWER(TRIM(geolocation_city)) as geolocation_city,
        LOWER(TRIM(geolocation_state)) as geolocation_state

    from source
)

select * from renamed