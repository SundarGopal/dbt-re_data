select * from {{ ref('re_data_base_metrics') }} where metric = 'row_count'