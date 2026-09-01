with
    source_reservoirs as (
        select * from {{ source('oil_and_gas_src', 'reservoirs') }}
    ),

    renamed as (
        select
            reservoir_id,
            reservoir_name,
            discovery_date,
            reservoir_status,
            field_id,
            updated_at
        from source_reservoirs
    )

select * from renamed
