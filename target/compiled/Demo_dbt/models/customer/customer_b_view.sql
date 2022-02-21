


with source_data as (

        select * from "dbt"."public_new"."customer_branch_b"

)

select *
from source_data