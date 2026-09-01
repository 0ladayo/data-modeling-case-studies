with
    source_fields as (
        select * from {{ source('oil_and_gas_src', 'fields') }}
    ),

    renamed as (
        select
            field_id,
            field_name,
            discovery_date,
            field_status,
            updated_at
        from source_fields
    )

select * from renamed
