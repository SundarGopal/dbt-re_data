

with source_data as (
    select * from "dbt"."public_new"."products_branch_a"
)

select *
from source_data