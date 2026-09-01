with
    stg_production as (select * from {{ ref('stg_production') }}),

    dim_wells as (
        select * from {{ ref('dim_wells') }}
    ),

    final as (
        select
            w.well_key,
            p.well_id,
            cast(format_date('%Y%m%d', cast(p.production_date as date)) as int64) as production_date_key,
            p.production_date,
            p.uptime,
            p.oil_production,
            p.gas_production,
            p.water_production
        from stg_production p
        left join dim_wells w
            on p.well_id = w.well_id
            and p.production_date >= cast(w.valid_from as date)
            and (w.valid_to is null or p.production_date < cast(w.valid_to as date))
    )

select * from final
