select
    *
from {{ source('pagila', 'actor') }}
where last_update < (now() - interval '100 years')
