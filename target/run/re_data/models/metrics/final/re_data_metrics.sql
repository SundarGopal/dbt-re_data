
  create view "dbt"."public_new_re"."re_data_metrics__dbt_tmp" as (
    select * from "dbt"."public_new_re"."re_data_base_metrics"
  );