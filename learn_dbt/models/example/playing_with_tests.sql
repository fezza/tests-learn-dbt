{{ config(materialized='table') }}

with sample_customer as (
  select * 
  from {{ source('sample', 'customer') }}
)

select  c_custkey, 
        c_mktsegment, 
        {{renaming_segments('c_mktsegment')}} as new_segment 
from sample_customer