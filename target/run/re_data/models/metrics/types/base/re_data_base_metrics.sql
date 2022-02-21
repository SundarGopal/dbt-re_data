
      
    delete from "dbt"."public_new_re"."re_data_base_metrics"
    where (id) in (
        select (id)
        from "re_data_base_metrics__dbt_tmp205718845675"
    );
    

    insert into "dbt"."public_new_re"."re_data_base_metrics" ("id", "table_name", "column_name", "metric", "value", "time_window_start", "time_window_end", "interval_length_sec", "computed_on")
    (
        select "id", "table_name", "column_name", "metric", "value", "time_window_start", "time_window_end", "interval_length_sec", "computed_on"
        from "re_data_base_metrics__dbt_tmp205718845675"
    )
  