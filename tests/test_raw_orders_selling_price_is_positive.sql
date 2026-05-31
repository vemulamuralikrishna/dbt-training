with orders_cte
as
(
    SELECT * from {{ ref('raw_orders') }}
)
SELECT
    orderid,
    sum(ordersellingprice) as total_sp
from orders_cte
GROUP BY 
    orderid
HAVING total_sp < 0
