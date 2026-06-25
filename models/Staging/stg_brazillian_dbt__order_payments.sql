with

source as (
    select * from {{ source('brazillian_dbt', 'olist_order_payments_dataset') }}
),

renamed as (
    select
        order_id,
        payment_sequential,
        payment_installments,
        payment_value,
        case 
            when payment_type= 'credit_card' then 'Credit Card'
            when payment_type= 'boleto' then 'Boleto'
            when payment_type= 'voucher' then 'Voucher'
            when payment_type= 'debit_card' then 'Debit Card'
            when payment_type= 'not_defined' then 'Not Defined'
            else 'Unknown'
        end as payment_type
        case 
            when payment_type in ('credit_card,' 'debit_card') then 'Card'
            else 'Cash'
        end as payment_method
    from source

)

select * from renamed