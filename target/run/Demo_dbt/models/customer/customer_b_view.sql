
  create view "dbt"."public_new"."customer_b_view__dbt_tmp" as (
    


with source_data as (

        select * from "dbt"."public_new"."customer_branch_b"

)

select *
from source_data
  );