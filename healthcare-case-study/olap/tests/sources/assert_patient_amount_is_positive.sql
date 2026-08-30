SELECT claim_id
FROM {{ source('healthcare_src', 'medical_claims')}}
WHERE patient_paid_amount < 0