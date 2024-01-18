
{{ config(materialized='table') }}

select  c.c_custkey, 
  c.c_name,  
  sum(nvl(o.o_totalprice,0)) as total_order_price
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER c
left join SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS o 
on c.c_custkey = o.o_custkey
group by c.c_custkey, 
  c.c_name

