SELECT
    customerid,
    segment,
    country,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }}
GROUP BY
    customerid,
    segment,
    country