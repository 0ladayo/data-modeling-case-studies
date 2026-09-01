with
    stg_facilities as (
        select * from {{ ref('stg_facilities') }}
    ),

    final as (
        select
            facility_sk,
            facility_id,
            facility_name,
            post_code,
            city,
            valid_from,
            coalesce(valid_to, timestamp('2099-12-31')) as valid_to,
            is_current_record
        from stg_facilities
    )

select * from final
