
      
    delete from "dbt"."public_new_re"."re_data_columns_over_time"
    where (id) in (
        select (id)
        from "re_data_columns_over_time__dbt_tmp205717579963"
    );
    

    insert into "dbt"."public_new_re"."re_data_columns_over_time" ("id", "table_name", "column_name", "data_type", "is_nullable", "detected_time")
    (
        select "id", "table_name", "column_name", "data_type", "is_nullable", "detected_time"
        from "re_data_columns_over_time__dbt_tmp205717579963"
    )
  