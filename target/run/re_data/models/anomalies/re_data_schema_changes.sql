
      
    delete from "dbt"."public_new_re"."re_data_schema_changes"
    where (id) in (
        select (id)
        from "re_data_schema_changes__dbt_tmp205718466487"
    );
    

    insert into "dbt"."public_new_re"."re_data_schema_changes" ("id", "table_name", "operation", "column_name", "data_type", "is_nullable", "prev_column_name", "prev_data_type", "prev_is_nullable", "detected_time")
    (
        select "id", "table_name", "operation", "column_name", "data_type", "is_nullable", "prev_column_name", "prev_data_type", "prev_is_nullable", "detected_time"
        from "re_data_schema_changes__dbt_tmp205718466487"
    )
  