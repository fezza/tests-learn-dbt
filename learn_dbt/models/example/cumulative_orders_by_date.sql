
{{ config(materialized='table') }}


select o_orderdate,  sum(sum(o_totalprice)) over (order by o_orderdate) as total_price
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS

{% if target.name == 'dev' %}
where year(o_orderdate) = 1996
{% endif %}


group by 1
order by 1 