SELECT 
-- from orders table
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
-- from raw customer
c.customerid,
c.customername,
c.segment,
c.country,
-- from raw product
p.productid,
p.category,
p.productname,
p.subcategory,
d.delivery_team
FROM  {{ ref('raw_orders') }} o
LEFT JOIN {{ ref('raw_customer') }} c
ON o.customerid = c.customerid
LEFT JOIN {{ ref('raw_product') }} p
ON o.productid = p.productid
LEFT JOIN {{ ref('delivery_team') }} d
ON o.shipmode = d.shipmode