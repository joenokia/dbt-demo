select
    id as order_id,
    user_id as customer_id,
    order_date,
    status,
    case
        when status in ('placed', 'shipped', 'completed')
            then 'Y'
        when status in ('returned', 'return_pending')
            then 'N'
    end as is_valid

from {{ source('jaffle_shop', 'orders') }}