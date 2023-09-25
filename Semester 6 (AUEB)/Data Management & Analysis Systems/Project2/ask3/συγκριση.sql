checkpoint dbcc dropcleanbuffers

set statistics io, time on
SELECT customers.market_segment, SUM(filtered_orders.totalprice)
FROM customers
JOIN (select totalprice, custkey
from orders
WHERE orderdate >= '1996-01-01' AND orderdate < '1997-01-01') AS filtered_orders ON customers.custkey = filtered_orders.custkey
GROUP BY market_segment



checkpoint dbcc dropcleanbuffers

select market_segment, sum(totalprice)
 from customers, orders
 where customers.custkey=orders.custkey and YEAR(orderdate) = 1996
 group by market_segment


set statistics io, time off