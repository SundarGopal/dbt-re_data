
  create view "dbt"."public_new"."order_a_view__dbt_tmp" as (
    


with source_data as (

    select * from "dbt"."public_new"."order_branch_a"

)

select *
from source_data
  );