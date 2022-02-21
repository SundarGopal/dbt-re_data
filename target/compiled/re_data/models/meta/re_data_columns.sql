

-- depends_on: "dbt"."public_new_re_internal"."re_data_run_started_at"
-- depends_on: "dbt"."public_new_re"."re_data_monitored"


    
    

    with columns_from_select as (
        
            
            
    
    select
        table_name,
        table_schema,
        table_catalog,
        column_name,
        data_type,
        is_nullable
    from
    
    
     dbt .  INFORMATION_SCHEMA.columns
    where
    table_schema = 'public_new'




        
    )

    select
        cast (table_name as 
    
    text

 ) as name,
        cast (table_schema as 
    
    text

 ) as schema,
        cast (table_catalog as 
    
    text

 ) as database,
        cast (column_name as 
    
    text

 ) as column_name,
        cast (data_type as 
    
    text

 ) as data_type,
        cast (case is_nullable when 'YES' then 1 else 0 end as 
    
    BOOLEAN

 ) as is_nullable,
    (current_timestamp at time zone 'utc')::
    timestamp

as computed_on
    from columns_from_select

    

