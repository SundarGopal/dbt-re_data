


    
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
        cast (some_string as 
    
    text

 ) as name,
        cast (some_string as 
    
    text

 ) as schema,
        cast (some_string as 
    
    text

 ) as database,
        cast (some_string as 
    
    text

 ) as time_filter,
        cast (some_string as 
    
    text

 ) as metrics,
        cast (some_string as 
    
    text

 ) as columns
    from dummy_table
    where some_num = 2
