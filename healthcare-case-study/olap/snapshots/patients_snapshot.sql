{% snapshot patients_snapshot %}

{{
    config(
        unique_key='patient_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select * from {{ source('healthcare_src', 'patients') }}

{% endsnapshot %}
