
  create view "dbt"."public_new_re"."re_data_alerts__dbt_tmp" as (
    select
    'anomaly' as type,
    

    regexp_replace( table_name, '(")|(`)', '', 'g') as model,
    message,
    last_value_text as value,
    time_window_end
from
    "dbt"."public_new_re"."re_data_anomalies"
union all

select
    'schema_change' as type,
    

    regexp_replace( table_name, '(")|(`)', '', 'g') as model,
    
    case 
        when operation = 'column_added'
            then 'column ' || column_name || ' of type ' || data_type || ' was added.'
        when operation = 'column_removed'
            then 'column ' || prev_column_name || ' of type ' || prev_data_type || ' was removed.'
        when operation = 'type_change'
            then column_name || ' column data type was changed from ' || prev_data_type || ' to ' || data_type || '.'
        else ''
    end
 as message,
    '' as value,
    detected_time as time_window_end
from "dbt"."public_new_re"."re_data_schema_changes"
  );