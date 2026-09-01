with
    wells_snapshot as (
        select * from {{ ref('wells_snapshot') }}
    ),

    final as (
        select
            dbt_scd_id as well_key,
            well_id,
            well_name,
            well_status,
            drilling_date,
            reservoir_name,
            reservoir_discovery_date,
            reservoir_status,
            field_name,
            field_discovery_date,
            field_status,
            coalesce(last_modified_at, dbt_valid_from) as valid_from,
            dbt_valid_to as valid_to,
            case when dbt_valid_to is null then true else false end as is_current
        from wells_snapshot
    )

select * from final
