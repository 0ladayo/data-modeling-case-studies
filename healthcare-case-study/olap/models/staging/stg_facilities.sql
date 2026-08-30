with source_snapshot_facilities as (
    select * from {{ ref('facilities_snapshot')}}
),

renamed as (
    select
        dbt_scd_id as facility_sk,
        facility_id,
        facility_name,
        post_code,
        city,
        dbt_valid_from as valid_from,
        dbt_valid_to as valid_to,
        case when dbt_valid_to is null then true
             else false
        end as is_current_record
    from source_snapshot_facilities
)

select * from renamed