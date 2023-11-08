{{ config(
    materialized = "table",
    alias='an-aliased-view-for-monthly-billing'
) }}

SELECT 
    pbc."BillingMonth" as billing_month,
    pbc.customer_id,
    pbc.amount,
    cust.email
FROM
    {{ ref('payments_by_customer_by_month')}} pbc
    left outer join {{ ref('customer_details')}} cust on pbc.customer_id = cust.customer_id
ORDER BY
    pbc."BillingMonth"
