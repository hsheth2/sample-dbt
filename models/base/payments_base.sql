{{ config(
    materialized="view",
) }}

with payments as (

    select 
        *
    from 
        {{ source('pagila', 'payment_p2020_01')}}
    UNION ALL
    select 
        *
    from 
        {{ source('pagila', 'payment_p2020_02')}}
    UNION ALL
    select 
        *
    from 
        {{ source('pagila', 'payment_p2020_02')}}
    UNION ALL
    select 
        *
    from 
        {{ source('pagila', 'payment_p2020_03')}}
    UNION ALL
    select 
        *
    from 
        {{ source('pagila', 'payment_p2020_04')}}
    UNION ALL
    select 
        *
    from 
        {{ source('pagila', 'payment_p2020_05')}}
    UNION ALL
    select 
        *
    from 
        {{ source('pagila', 'payment_p2020_06')}}
)

select *
from payments

