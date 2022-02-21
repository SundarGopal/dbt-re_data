-- Use the `ref` function to select from other models

select *
from "dbt"."public_new"."my_first_dbt_model"
where id = 1