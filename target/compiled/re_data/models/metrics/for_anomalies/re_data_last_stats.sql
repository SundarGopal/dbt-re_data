
    select
        table_name,
        column_name,
        metric,
        avg(value) as last_avg,
        stddev(value) as last_stddev,
        max(time_window_end) as last_metric_time,
        interval_length_sec,
        max(computed_on) as computed_on
    from
        "dbt"."public_new_re"."re_data_base_metrics"
    where
        time_window_end >
   
    
    cast('2022-02-20 00:00:00' as timestamp) 
 - interval '30 days'

and
        time_window_end <=
    cast('2022-02-21 00:00:00' as timestamp)
group by
        table_name, column_name, metric, interval_length_sec    

