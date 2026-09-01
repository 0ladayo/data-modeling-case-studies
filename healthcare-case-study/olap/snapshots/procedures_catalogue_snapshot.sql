{% snapshot procedures_catalogue_snapshot %}

{{
    config(
        unique_key='procedure_catalogue_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select * from {{ source('healthcare_src', 'procedures_catalogue') }}

{% endsnapshot %}
