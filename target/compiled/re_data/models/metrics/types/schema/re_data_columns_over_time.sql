


with columns as (

select
    
    
    '"' || cols.database || '"' || '.' || '"' || cols.schema || '"' || '.' || '"' || cols.name || '"'

 as table_name,
    cols.column_name,
    cols.data_type,
    cols.is_nullable,
    cast (
    (current_timestamp at time zone 'utc')::
    timestamp

 as 
    
    timestamp without time zone

 ) as detected_time
from
    "dbt"."public_new_re"."re_data_columns" cols, "dbt"."public_new_re"."re_data_monitored" tables
where
    cols.name = tables.name and cols.schema = tables.schema and cols.database = tables.database
)

select
    md5(cast(coalesce(cast(table_name as 
    varchar
), '') || '-' || coalesce(cast(column_name as 
    varchar
), '') || '-' || coalesce(cast(detected_time as 
    varchar
), '') as 
    varchar
)) as id,
    table_name,
    column_name,
    data_type,
    is_nullable,
    detected_time
from columns