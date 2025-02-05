
      

  create  table "postgres".test_normalization_namespace."simple_stream_with_n__lting_into_long_names"
  as (
    
with __dbt__cte__simple_stream_with_n__lting_into_long_names_ab1 as (

-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    jsonb_extract_path_text(_airbyte_data, 'id') as "id",
    jsonb_extract_path_text(_airbyte_data, 'date') as "date",
    _airbyte_ab_id,
    _airbyte_emitted_at,
    now() as _airbyte_normalized_at
from "postgres".test_normalization_namespace._airbyte_raw_simple_stream_with_namespace_resulting_into_long_names as table_alias
-- simple_stream_with_n__lting_into_long_names
where 1 = 1

),  __dbt__cte__simple_stream_with_n__lting_into_long_names_ab2 as (

-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast("id" as 
    varchar
) as "id",
    cast("date" as 
    varchar
) as "date",
    _airbyte_ab_id,
    _airbyte_emitted_at,
    now() as _airbyte_normalized_at
from __dbt__cte__simple_stream_with_n__lting_into_long_names_ab1
-- simple_stream_with_n__lting_into_long_names
where 1 = 1

),  __dbt__cte__simple_stream_with_n__lting_into_long_names_ab3 as (

-- SQL model to build a hash column based on the values of this record
select
    md5(cast(coalesce(cast("id" as 
    varchar
), '') || '-' || coalesce(cast("date" as 
    varchar
), '') as 
    varchar
)) as _airbyte_simple_stre__nto_long_names_hashid,
    tmp.*
from __dbt__cte__simple_stream_with_n__lting_into_long_names_ab2 tmp
-- simple_stream_with_n__lting_into_long_names
where 1 = 1

)-- Final base SQL model
select
    "id",
    "date",
    _airbyte_ab_id,
    _airbyte_emitted_at,
    now() as _airbyte_normalized_at,
    _airbyte_simple_stre__nto_long_names_hashid
from __dbt__cte__simple_stream_with_n__lting_into_long_names_ab3
-- simple_stream_with_n__lting_into_long_names from "postgres".test_normalization_namespace._airbyte_raw_simple_stream_with_namespace_resulting_into_long_names
where 1 = 1

  );
  