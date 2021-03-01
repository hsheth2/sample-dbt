{{ config(
    materialized = "table",
) }}

SELECT
    date_trunc('month', payment_date) as "billing_month",
    customer_id,
    sum(amount) as "amount"
FROM
    {{ ref('payments_base')}}
GROUP BY
    billing_month,
    customer_id

