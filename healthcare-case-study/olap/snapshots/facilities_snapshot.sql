{% snapshot facilities_snapshot %}

{{
    config(
        target_database='data-modelling-case-studies',
        target_schema='healthcare_dataset',
        unique_key='facility_id',       
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select * from {{ source('healthcare_src', 'facilities') }}

{% endsnapshot %}