with source_snapshot_procedures_catalogue as (
    select * from {{ ref('procedures_catalogue_snapshot')}}
),

renamed as (
    select
        dbt_scd_id as procedure_catalogue_sk,
        procedure_catalogue_id,
        procedure_name,
        cost,
        dbt_valid_from as valid_from,
        dbt_valid_to as valid_to,
        case when dbt_valid_to is null then true
             else false
        end as is_current_record
    from source_snapshot_procedures_catalogue
)

select * from renamed