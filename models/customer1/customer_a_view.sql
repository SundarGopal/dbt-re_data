{{ config(materialized='view') }}


with source_data as (

    select * from {{ source('public_new', 'customer_branch_a') }}

)

select *
from source_data
