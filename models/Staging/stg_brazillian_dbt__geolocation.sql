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
        geolocation_zip_code_prefix as zip_code,
        geolocation_lat as latitude,
        geolocation_lng as longitude,
        CASE
            when geolocation_city like '%sao paulo%' then 'São Paulo'
            when geolocation_city like '%brasilia%' then 'Brasília'
            when geolocation_city like '%rio de janeiro%' then 'Rio de Janeiro'
            when geolocation_city like '%salvador%' then 'Salvador'
            when geolocation_city like '%goiania%' then 'Goiânia'
            when geolocation_city like '%sao jose%' then 'São José'
            else INITCAP(geolocation_city)
        end as city,
        CASE 
            when geolocation_state = 'sp' then 'São Paulo'
            when geolocation_state = 'rj' then 'Rio de Janeiro'
            when geolocation_state = 'es' then 'Espírito Santo'
            when geolocation_state = 'mg' then 'Minas Gerais'
            when geolocation_state = 'ba' then 'Bahia'
            when geolocation_state = 'se' then 'Sergipe'
            when geolocation_state = 'pe' then 'Pernambuco'
            when geolocation_state = 'rn' then 'Rio Grande do Norte'
            when geolocation_state = 'al' then 'Alagoas'
            when geolocation_state = 'pb' then 'Paraíba'
            when geolocation_state = 'ce' then 'Ceará'
            when geolocation_state = 'pi' then 'Piauí'
            when geolocation_state = 'ma' then 'Maranhão'
            when geolocation_state = 'pa' then 'Pará'
            when geolocation_state = 'ap' then 'Amapá'
            when geolocation_state = 'am' then 'Amazonas'
            when geolocation_state = 'rr' then 'Roraima'
            when geolocation_state = 'ac' then 'Acre'
            when geolocation_state = 'df' then 'Distrito Federal'
            when geolocation_state = 'go' then 'Goiás'
            when geolocation_state = 'ro' then 'Rondônia'
            when geolocation_state = 'to' then 'Tocantins'
            when geolocation_state = 'mt' then 'Mato Grosso'
            when geolocation_state = 'ms' then 'Mato Grosso do Sul'
            when geolocation_state = 'pr' then 'Paraná'
            when geolocation_state = 'sc' then 'Santa Catarina'
            when geolocation_state = 'rs' then 'Rio Grande do Sul'
            else geolocation_state
        end as state
    from deduplicated
    where row_num = 1
)

select * from renamed