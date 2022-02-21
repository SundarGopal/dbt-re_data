
      

    insert into "dbt"."public_new_re"."re_data_test_history" ("table_name", "column_name", "test_name", "status", "run_at")
    (
        select "table_name", "column_name", "test_name", "status", "run_at"
        from "re_data_test_history__dbt_tmp205717190345"
    )
  