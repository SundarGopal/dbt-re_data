


    
    with dummy_table as (
        select
            cast (null as 
    
    text

) as some_string,
            cast (1 as 
    
    double precision

) as some_num,
            cast (null as 
    
    timestamp without time zone

) as some_time,
            cast (true as 
    
    BOOLEAN

) as some_bool
    )

    select 
        cast (some_time as 
    
    text

 ) as table_name,
        cast (some_string as 
    
    text

 ) as column_name,
        cast (some_string as 
    
    text

 ) as test_name,
        cast (some_string as 
    
    text

 ) as status,
        cast (some_time as 
    
    timestamp without time zone

 ) as run_at
    from dummy_table
    where some_num = 2
