

    select
        table_name,
        column_name,
        metric,
        value as last_value,
        interval_length_sec,
        computed_on
    from 
        "dbt"."public_new_re"."re_data_base_metrics"
    where
        time_window_end =
    cast('2022-02-21 00:00:00' as timestamp)


