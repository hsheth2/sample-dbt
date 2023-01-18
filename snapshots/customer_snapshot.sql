{% snapshot customer_snapshot %}

{{
    config(
      target_database='pagila',
      target_schema='public',
      unique_key='customer_id',

      strategy='timestamp',
      updated_at='last_update',
    )
}}

select * from {{ source('pagila', 'customer') }}

{% endsnapshot %}
