
with

source as (
    select * from {{ source('brazillian_dbt', 'olist_sellers_dataset') }}
),

renamed as (
    select
        
        seller_id,
        seller_zip_code_prefix as zip_code
         case 
            when seller_city like '%sao paulo%' then 'São Paulo'
            when seller_city = 'sp' then 'São Paulo'
            when seller_city = 'sp / sp' then 'São Paulo'
            when seller_city = 'sao paulo / sao paulo' then 'São Paulo'
            when seller_city = 'sao paulop' then 'São Paulo'
            when seller_city = 'sao paulo - sp' then 'São Paulo'
            when seller_city = 'são paulo' then 'São Paulo'
            when seller_city = 'sp' then 'São Paulo'
            when seller_city = 'sao paluo' then 'São Paulo'
            else INITCAP(eller_city)
        end as city
        case
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
        end as seller_city

    from source
)

select * from renamed
