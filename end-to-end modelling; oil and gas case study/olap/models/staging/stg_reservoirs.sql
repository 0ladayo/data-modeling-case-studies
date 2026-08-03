with
    source_reservoirs as (
        select
            reservoir_id,
            reservoir_name,
            discovery_date,
            reservoir_status,
            field_id,
            updated_at
        from {{ source('oil_and_gas_src', 'reservoirs') }}
    )

select
    reservoir_id, reservoir_name, discovery_date, reservoir_status, field_id, updated_at
from source_reservoirs
