
      
    delete from "dbt"."public_new_re"."re_data_z_score"
    where (id) in (
        select (id)
        from "re_data_z_score__dbt_tmp205719128039"
    );
    

    insert into "dbt"."public_new_re"."re_data_z_score" ("id", "table_name", "column_name", "metric", "z_score_value", "last_value", "last_avg", "last_stddev", "time_window_end", "interval_length_sec", "computed_on")
    (
        select "id", "table_name", "column_name", "metric", "z_score_value", "last_value", "last_avg", "last_stddev", "time_window_end", "interval_length_sec", "computed_on"
        from "re_data_z_score__dbt_tmp205719128039"
    )
  