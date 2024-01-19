{% macro renaming_segments(column_name) %}
CASE
  WHEN {{column_name}} in ('BUILDING', 'HOUSEHOLD') 
  THEN 'SEGMENT_1'
  ELSE 'SEGMENT_2'
END
{% endmacro %}