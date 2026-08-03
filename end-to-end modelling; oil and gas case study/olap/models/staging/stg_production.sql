with
    source_production as (
        select
            date as production_date,
            cast(
                format_date('%Y%m%d', cast(date as date)) as int64
            ) as production_date_key,
            well_id,
            oil_production,
            gas_production,
            water_production
        from {{ source('oil_and_gas_src', 'production') }}
    )

select
    production_date,
    production_date_key,
    well_id,
    oil_production,
    gas_production,
    water_production
from source_production
