{{ config(materialized='view') }}


with source_data as (

    select * from {{ source('public_new', 'order_branch_b') }}

)

select *
from source_data
