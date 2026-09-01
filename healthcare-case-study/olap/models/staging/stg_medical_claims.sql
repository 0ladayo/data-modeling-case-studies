with
    source_medical_claims as (
        select * from {{ source('healthcare_src', 'medical_claims') }}
    ),

    renamed as (
        select
            claim_id,
            patient_id,
            provider_id,
            facility_id,
            procedure_catalogue_id,
            procedure_date,
            billed_amount,
            insurance_paid_amount,
            patient_paid_amount
        from source_medical_claims
    )

select * from renamed
