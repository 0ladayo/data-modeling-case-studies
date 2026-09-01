with
    source_production as (
        select * from {{ source('oil_and_gas_src', 'production') }}
    ),

    renamed as (
        select
            well_id,
            date as production_date,
            uptime,
            oil_production,
            gas_production,
            water_production
        from source_production
    )

select * from renamed
