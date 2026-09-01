with
    stg_patients as (
        select * from {{ ref('stg_patients') }}
    ),

    final as (
        select
            patient_sk,
            patient_id,
            first_name,
            last_name,
            date_of_birth,
            gender,
            post_code,
            city,
            valid_from,
            coalesce(valid_to, timestamp('2099-12-31')) as valid_to,
            is_current_record
        from stg_patients
    )

select * from final
