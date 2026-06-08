with order_payments as (
    select * from {{ ref('stg_brazillian_dbt__order_payments') }}
),

orders as (
    select * from {{ ref('stg_brazillian_dbt__orders') }}
)

select
    order_payments.order_id,
    order_payments.payment_type,
    order_payments.payment_value,
    order_payments.payment_installments,
    orders.customer_id,
    orders.order_status
    case 
        when order_payments.payment_type = 'credit_card' then 1
        when order_payments.payment_type = 'debit_card' then 1
        else 0
    end as card_payment
from order_payments
join orders
    on order_payments.order_id = orders.order_id
    