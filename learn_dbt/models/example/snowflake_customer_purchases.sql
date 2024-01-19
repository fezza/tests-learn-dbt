
{{ config(materialized='table') }}

select  c.c_custkey, 
  c.c_name,  
  sum(nvl(o.o_totalprice,0)) as total_order_price
from {{source ('sample', 'customer') }} c
left join {{source ('sample', 'orders') }} o 
on c.c_custkey = o.o_custkey
group by c.c_custkey, 
  c.c_name

