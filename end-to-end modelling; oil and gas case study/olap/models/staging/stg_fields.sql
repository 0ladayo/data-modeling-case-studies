with
    source_fields as (
        select field_id, field_name, discovery_date, field_status, updated_at
        from {{ source('oil_and_gas_src', 'fields') }}
    )

select field_id, field_name, discovery_date, field_status, updated_at
from source_fields
