{% snapshot providers_snapshot %}

{{
    config(
        unique_key='provider_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select * from {{ source('healthcare_src', 'providers') }}

{% endsnapshot %}
