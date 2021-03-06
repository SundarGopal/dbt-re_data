{{ config(materialized='view') }}


with source_data as (

    select c.customer_id, o.order_id, c.first_name, c.last_name, c.pincode, o.order_date, o.product_id, o.quantity
    from {{ source('public_new', 'customer_branch_b') }} c
    inner join {{ source('public_new', 'order_branch_b') }} o
    on c.customer_id = o.customer_id

)

select *
from source_data
