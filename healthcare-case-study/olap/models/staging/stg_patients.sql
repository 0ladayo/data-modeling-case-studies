with source_snapshot_patients as (
    select * from {{ ref('patients_snapshot')}}
),

renamed as (
    select
        dbt_scd_id as patient_sk,
        patient_id,
        first_name,
        last_name,
        date_of_birth,
        gender,
        post_code,
        city,
        dbt_valid_from as valid_from,
        dbt_valid_to as valid_to,
        case when dbt_valid_to is null then true
             else false
        end as is_current_record
    from source_snapshot_patients
)

select * from renamed