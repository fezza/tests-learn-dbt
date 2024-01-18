{{ config(materialized='incremental') }}


 select * 
 from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."TIME_DIM"
 where to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND)) <= current_time
 
 {% if is_incremental() %}
  and d_date > (select max(d_date) from {{this}} )
{% endif %}