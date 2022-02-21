
  create view "dbt"."public_new"."customer_order_product_ab_view__dbt_tmp" as (
    

with data1 as (

    select 'branch-a' as branch_name, c.customer_id, o.order_id, c.first_name, c.last_name, c.pincode, o.order_date, o.product_id, o.quantity
    from "dbt"."public_new"."customer_branch_a" c
    inner join "dbt"."public_new"."order_branch_a" o
    on c.customer_id = o.customer_id

    union

    select 'branch-b' as branch_name , c.customer_id, o.order_id, c.first_name, c.last_name, c.pincode, o.order_date, o.product_id, o.quantity
    from "dbt"."public_new"."customer_branch_b" c
    inner join "dbt"."public_new"."order_branch_b" o
    on c.customer_id = o.customer_id

),

source_data as (

    select md5(cast(coalesce(cast(c.order_id as 
    varchar
), '') || '-' || coalesce(cast(c.branch_name as 
    varchar
), '') as 
    varchar
)) as id
    , c.customer_id, c.order_id, c.product_id, c.first_name, c.last_name, c.pincode, c.order_date, c.quantity, p.product_name, p.unit, p.unit_price
    from data1 c
    inner join "dbt"."public_new"."products_branch_a" p
    on c.product_id = p.product_id



)

select *
from source_data
  );