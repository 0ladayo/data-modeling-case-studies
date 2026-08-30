SELECT claim_id
FROM {{ source('healthcare_src', 'medical_claims')}}
WHERE insurance_paid_amount < 0