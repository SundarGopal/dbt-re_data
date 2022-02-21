

  create  table "dbt"."public_new_re_internal"."re_data_last_base_metrics_thread1__dbt_tmp"
  as (
    
    
    
    
        -- depends_on: "dbt"."public_new_re"."re_data_monitored"
    
        -- depends_on: "dbt"."public_new_re"."re_data_columns"
    
        -- depends_on: "dbt"."public_new_re_internal"."re_data_run_started_at"
    
        -- depends_on: "dbt"."public_new_re_internal"."re_data_last_base_metrics_part1"
    



    

    
        
        -- we are splitting computing metrics to 4 different threads
        
        
            
            
            
                
            
            
            
            
 
            

            

            

            
            

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            

             
            
        
    
        -- we are splitting computing metrics to 4 different threads
        
        
    
        -- we are splitting computing metrics to 4 different threads
        
        
    
        -- we are splitting computing metrics to 4 different threads
        
        
    
        -- we are splitting computing metrics to 4 different threads
        
        
            
            
            
                
            
            
            
            
 
            

            

            

            
            

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            

             
            
        
    
        -- we are splitting computing metrics to 4 different threads
        
        
    
        -- we are splitting computing metrics to 4 different threads
        
        
    
        -- we are splitting computing metrics to 4 different threads
        
        
    
        -- we are splitting computing metrics to 4 different threads
        
        
            
            
            
                
            
            
            
            
 
            

            

            

            
            

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            
                
                

                
                    
                

                

                

            

             
            
        
    

    

    
    
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

 ) as table_name,
        cast (some_string as 
    
    text

 ) as column_name,
        cast (some_string as 
    
    text

 ) as metric,
        cast (some_num as 
    
    double precision

 ) as value
    from dummy_table
    where some_num = 2



  );