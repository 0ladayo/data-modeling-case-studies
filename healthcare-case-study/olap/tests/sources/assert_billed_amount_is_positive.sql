SELECT claim_id
FROM {{ source('healthcare_src', 'medical_claims')}}
WHERE billed_amount < 0