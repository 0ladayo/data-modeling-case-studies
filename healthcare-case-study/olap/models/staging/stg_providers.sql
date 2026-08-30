with source_snapshot_providers as (
    select * from {{ ref('providers_snapshot')}}
),

renamed as (
    select
        dbt_scd_id as provider_sk,
        provider_id,
        first_name,
        last_name,
        npi,
        speciality,
        dbt_valid_from as valid_from,
        dbt_valid_to as valid_to,
        case when dbt_valid_to is null then true
             else false
        end as is_current_record
    from source_snapshot_providers
)

select * from renamed