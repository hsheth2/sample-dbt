{{ config(
    materialized = "ephemeral",
) }}

SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name as "full_name",
    (
        select cs.first_name || ' ' || cs.last_name
        from {{ ref('customer_snapshot') }} cs where cs.customer_id = c.customer_id
        order by dbt_valid_from desc
        limit 1
    ) as "initial_full_name",
    c.email,
    a.address,
    m.city,
    a.postal_code,
    a.phone
FROM
    {{ source('pagila', 'customer')}} c
    left outer join {{ source('pagila', 'address')}} a on c.address_id = a.address_id
    left outer join {{ source('pagila', 'city') }} m on a.city_id = m.city_id
