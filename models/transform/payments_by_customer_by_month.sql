{{ config(
    materialized = "table",
) }}

SELECT
    date_trunc('month', payment_date) as "BillingMonth",
    customer_id,
    sum(amount) as "amount"
FROM
    {{ ref('payments_base')}}
GROUP BY
    "BillingMonth",
    customer_id

