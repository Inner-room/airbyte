{{ config(
    cluster_by = "_airbyte_emitted_at",
    partition_by = {"field": "_airbyte_emitted_at", "data_type": "timestamp", "granularity": "day"},
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_test_normalization",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        'id',
        'date',
        adapter.quote('partition'),
    ]) }} as _airbyte_nested_stream_with_complex_columns_resulting_into_long_names_hashid,
    tmp.*
from {{ ref('nested_stream_with_complex_columns_resulting_into_long_names_ab2') }} tmp
-- nested_stream_with_complex_columns_resulting_into_long_names
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at') }}

