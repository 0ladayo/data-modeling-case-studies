with
    source_wells as (
        select * from {{ source('oil_and_gas_src', 'wells') }}
    ),

    renamed as (
        select
            well_id,
            well_name,
            well_status,
            drilling_date,
            reservoir_id,
            updated_at
        from source_wells
    )

select * from renamed
