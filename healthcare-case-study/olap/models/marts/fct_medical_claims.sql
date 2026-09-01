with
    stg_medical_claims as (
        select * from {{ ref('stg_medical_claims') }}
    ),

    dim_facilities as (
        select * from {{ ref('dim_facilities') }}
    ),

    dim_patients as (
        select * from {{ ref('dim_patients') }}
    ),

    dim_providers as (
        select * from {{ ref('dim_providers') }}
    ),

    dim_procedures_catalogue as (
        select * from {{ ref('dim_procedures_catalogue') }}
    ),

    final as (
        select
            m.claim_id,
            cast(format_date('%Y%m%d', date(m.procedure_date)) as int64) as procedure_date_key,
            m.procedure_date,
            p1.patient_sk,
            p2.provider_sk,
            f.facility_sk,
            p3.procedure_catalogue_sk,
            m.billed_amount,
            m.insurance_paid_amount,
            m.patient_paid_amount
        from stg_medical_claims m
        left join dim_patients p1
            on m.patient_id = p1.patient_id
            and m.procedure_date >= cast(p1.valid_from as date)
            and m.procedure_date < cast(p1.valid_to as date)
        left join dim_providers p2
            on m.provider_id = p2.provider_id
            and m.procedure_date >= cast(p2.valid_from as date)
            and m.procedure_date < cast(p2.valid_to as date)
        left join dim_facilities f
            on m.facility_id = f.facility_id
            and m.procedure_date >= cast(f.valid_from as date)
            and m.procedure_date < cast(f.valid_to as date)
        left join dim_procedures_catalogue p3
            on m.procedure_catalogue_id = p3.procedure_catalogue_id
            and m.procedure_date >= cast(p3.valid_from as date)
            and m.procedure_date < cast(p3.valid_to as date)
    )

select * from final
