{{ config(
    materialized = "ephemeral",
) }}

SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name as "full_name",
    c.email,
    a.address,
    m.city,
    a.postal_code,
    a.phone
FROM
    {{ source('pagila', 'customer')}} c
    left outer join {{ source('pagila', 'address')}} a on c.address_id = a.address_id
    left outer join {{ source('pagila', 'city') }} m on a.city_id = m.city_id
