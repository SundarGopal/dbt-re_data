

-- depends_on: "dbt"."public_new_re_internal"."re_data_run_started_at"
-- depends_on: "dbt"."public_new_re"."re_data_columns_over_time"


    

    

    
    

    
        
    




    with curr_schema as (
        select * from "dbt"."public_new_re"."re_data_columns_over_time"
        where detected_time = '2022-02-21 15:27:17.599612'
    ),


    prev_schema as (
        select * from "dbt"."public_new_re"."re_data_columns_over_time"
        where detected_time = '2022-02-21 15:23:57.324385'
    ),

    all_changes as (
            (
            select
                curr.table_name as table_name,
                'type_change' as operation,
                curr.column_name as column_name,
                curr.data_type as data_type,
                curr.is_nullable as is_nullable,

                prev.column_name as prev_column_name,
                prev.data_type as prev_data_type,
                prev.is_nullable as prev_is_nullable
            
            from curr_schema curr inner join prev_schema prev on (curr.table_name = prev.table_name and curr.column_name = prev.column_name)
            where
                curr.data_type != prev.data_type or 
                curr.is_nullable != prev.is_nullable
            )

        union all

        (

            select
                curr.table_name as table_name,
                'column_added' as operation,
                curr.column_name as column_name,
                curr.data_type as data_type,
                curr.is_nullable as is_nullable,

                null as prev_column_name,
                null as prev_data_type,
                null as prev_is_nullable
            
            from curr_schema curr left join prev_schema prev on (curr.table_name = prev.table_name and curr.column_name = prev.column_name)
            where prev.table_name is null and prev.column_name is null
        
        )

        union all

        (

            select
                prev.table_name as table_name,
                'column_removed' as operation,
                null as column_name,
                null as data_type,
                null as is_nullable,

                prev.column_name as prev_column_name,
                prev.data_type as prev_data_type,
                prev.is_nullable as prev_is_nullable
            
            from prev_schema prev left join curr_schema curr on (curr.table_name = prev.table_name and curr.column_name = prev.column_name)
            where curr.table_name is null and curr.column_name is null

        )
    ),

    all_with_time as (
        select
            all_changes.table_name,
            all_changes.operation,
            all_changes.column_name,
            all_changes.data_type,
            all_changes.is_nullable,
            all_changes.prev_column_name,
            all_changes.prev_data_type,
            all_changes.prev_is_nullable,
            
    (current_timestamp at time zone 'utc')::
    timestamp

 as detected_time
        from all_changes
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
        operation,
        column_name,
        data_type,
        is_nullable,
        prev_column_name,
        prev_data_type,
        prev_is_nullable,
        detected_time
    from all_with_time
    
