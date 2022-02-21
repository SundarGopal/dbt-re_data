
select
    *,
    

    case when column_name != '' then metric || '(' || column_name || ')'
    else metric
    end 
    || ' is ' ||
    
    
    trim(to_char(
    abs(
        ( 
            cast(last_value - last_avg as 
    
    double precision

)
        ) / 
        nullif(
            cast( last_avg as 
    
    double precision

 )
        , 0) * 100.0
    )
, '9999999999999999990D00'))


    || '% ' ||
    
    case when last_value > last_avg then 'greater than' 
    when last_value = last_avg then 'equal to'
    else 'less than' end

    || ' average.'
 as message,
    
    case 
        when metric = 'freshness' 
            then cast(
    
    trim(to_char(
    cast(last_value as 
    
    double precision

) / 3600
, '9999999999999999990D00'))

 as 
    
    text

) || ' hours'
        when 
    
    (metric ~ 'percent')

 
            then cast(
    
    trim(to_char(last_value, '9999999999999999990D00'))

 as 
    
    text

) || '%'
        when 
    
    (metric ~ 'count')

 
            then cast(last_value as 
    
    text

)
        else cast(
    
    trim(to_char(last_value, '9999999999999999990D00'))

 as 
    
    text

)
    end

 as last_value_text
from
    "dbt"."public_new_re"."re_data_z_score"
where
    abs(z_score_value) > 2