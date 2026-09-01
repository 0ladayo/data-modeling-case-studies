{{ config(materialized='ephemeral') }}

with
    stg_wells as (
        select
            well_id,
            well_name,
            well_status,
            drilling_date,
            reservoir_id,
            updated_at
        from {{ ref('stg_wells') }}
    ),

    stg_reservoirs as (
        select
            reservoir_id,
            reservoir_name,
            discovery_date,
            reservoir_status,
            field_id,
            updated_at
        from {{ ref('stg_reservoirs') }}
    ),

    stg_fields as (
        select
            field_id,
            field_name,
            discovery_date,
            field_status,
            updated_at
        from {{ ref('stg_fields') }}
    )

select
    w.well_id,
    w.well_name,
    w.well_status,
    w.drilling_date,
    r.reservoir_name,
    r.discovery_date as reservoir_discovery_date,
    r.reservoir_status,
    f.field_name,
    f.discovery_date as field_discovery_date,
    f.field_status,
    greatest(
        w.updated_at,
        coalesce(r.updated_at, w.updated_at),
        coalesce(f.updated_at, w.updated_at)
    ) as last_modified_at
from stg_wells w
left join stg_reservoirs r on w.reservoir_id = r.reservoir_id
left join stg_fields f on r.field_id = f.field_id
