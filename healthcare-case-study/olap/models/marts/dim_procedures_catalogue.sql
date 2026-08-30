with stg_procedures_catalogues as (
    select * from {{ ref('stg_procedures_catalogue') }}
),

final as (
    select
        procedure_catalogue_sk,
        procedure_catalogue_id,
        procedure_name,
        cost,
        valid_from,
        coalesce(valid_to, timestamp('2099-12-31')) as valid_to,
        is_current_record
    from stg_procedures_catalogues
)

select * from final