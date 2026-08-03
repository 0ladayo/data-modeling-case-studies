{% snapshot wells_snapshot %}

    {{
    config(
        target_database='data-modelling-case-studies',
        target_schema='oil_and_gas_dataset',
        unique_key='well_id',
        strategy='timestamp',
        updated_at='last_modified_at'
    )
}}

    select
        well_id,
        well_name,
        well_status,
        drilling_date,
        reservoir_name,
        reservoir_discovery_date,
        reservoir_status,
        field_name,
        field_discovery_date,
        field_status,
        last_modified_at
    from {{ ref('int_wells_joined') }}

{% endsnapshot %}
