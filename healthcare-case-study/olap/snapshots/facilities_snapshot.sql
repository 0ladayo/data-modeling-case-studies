{% snapshot facilities_snapshot %}

{{
    config(
        unique_key='facility_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select * from {{ source('healthcare_src', 'facilities') }}

{% endsnapshot %}
