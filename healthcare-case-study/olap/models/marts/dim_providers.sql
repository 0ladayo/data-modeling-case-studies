with stg_providers as (
    select * from {{ ref('stg_providers') }}
),

final as (
    select
        provider_sk,
        provider_id,
        first_name,
        last_name,
        npi,
        speciality,
        valid_from,
        coalesce(valid_to, timestamp('2099-12-31')) as valid_to,
        is_current_record
    from stg_providers
)

select * from final