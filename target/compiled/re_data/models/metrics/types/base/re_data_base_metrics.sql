

-- depends_on: "dbt"."public_new_re"."re_data_columns"
-- depends_on: "dbt"."public_new_re_internal"."re_data_last_base_metrics_thread0"
-- depends_on: "dbt"."public_new_re_internal"."re_data_last_base_metrics_thread1"
-- depends_on: "dbt"."public_new_re_internal"."re_data_last_base_metrics_thread2"
-- depends_on: "dbt"."public_new_re_internal"."re_data_last_base_metrics_thread3"
-- depends_on: "dbt"."public_new_re_internal"."re_data_last_base_metrics_part0"
-- depends_on: "dbt"."public_new_re_internal"."re_data_last_base_metrics_part1"
-- depends_on: "dbt"."public_new_re_internal"."re_data_last_base_metrics_part2"
-- depends_on: "dbt"."public_new_re_internal"."re_data_last_base_metrics_part3"
-- depends_on: "dbt"."public_new_re_internal"."re_data_run_started_at"
-- depends_on: "dbt"."public_new_re"."re_data_monitored"

with 

with_time_window as (
    
    
        
        select
            *,
            
    cast('2022-02-20 00:00:00' as timestamp) 
 as time_window_start,
            
    cast('2022-02-21 00:00:00' as timestamp)
 as time_window_end
        from "dbt"."public_new_re_internal"."re_data_last_base_metrics_part0" union all
    
        
        select
            *,
            
    cast('2022-02-20 00:00:00' as timestamp) 
 as time_window_start,
            
    cast('2022-02-21 00:00:00' as timestamp)
 as time_window_end
        from "dbt"."public_new_re_internal"."re_data_last_base_metrics_part1" union all
    
        
        select
            *,
            
    cast('2022-02-20 00:00:00' as timestamp) 
 as time_window_start,
            
    cast('2022-02-21 00:00:00' as timestamp)
 as time_window_end
        from "dbt"."public_new_re_internal"."re_data_last_base_metrics_part2" union all
    
        
        select
            *,
            
    cast('2022-02-20 00:00:00' as timestamp) 
 as time_window_start,
            
    cast('2022-02-21 00:00:00' as timestamp)
 as time_window_end
        from "dbt"."public_new_re_internal"."re_data_last_base_metrics_part3"
    
)
select
    md5(cast(coalesce(cast(table_name as 
    varchar
), '') || '-' || coalesce(cast(column_name as 
    varchar
), '') || '-' || coalesce(cast(metric as 
    varchar
), '') || '-' || coalesce(cast(time_window_start as 
    varchar
), '') || '-' || coalesce(cast(time_window_end as 
    varchar
), '') as 
    varchar
)) as id,
    cast (table_name as 
    
    text

 ) as table_name,
    cast (column_name as 
    
    text

 ) as column_name,
    cast (metric as 
    
    text

 ) as metric,
    cast (value as 
    
    double precision

 ) as value,
    cast (time_window_start as 
    
    timestamp without time zone

 ) as time_window_start,
    cast (time_window_end as 
    
    timestamp without time zone

 ) as time_window_end,
    cast (
        
    
   EXTRACT(EPOCH FROM (time_window_end - time_window_start ))

 as 
    INTEGER

    ) as interval_length_sec,
    (current_timestamp at time zone 'utc')::
    timestamp

as computed_on
from with_time_window