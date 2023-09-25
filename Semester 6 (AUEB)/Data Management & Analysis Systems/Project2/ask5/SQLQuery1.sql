checkpoint
dbcc dropcleanbuffers

set statistics io, time on

--SELECT cname, c_acctbal
--FROM customers
--WHERE c_acctbal > (
  --  SELECT AVG(c_acctbal)
 --   FROM customers
--);

SELECT c.cname, AVG(o.totalprice) AS avg_total_price
FROM customers c
JOIN orders o ON c.custkey = o.custkey
GROUP BY c.custkey, c.cname
ORDER BY avg_total_price DESC;
SELECT r.region, SUM(li.quantity) AS total_orders_quantity, SUM(li.quantity * li.price * (1 - li.discount)) AS total_revenue
FROM regions r
INNER JOIN nations n ON r.regionkey = n.regionkey
INNER JOIN customers c ON n.nationkey = c.nationkey
INNER JOIN orders o ON c.custkey = o.custkey
INNER JOIN lineitem li ON o.orderkey = li.orderkey
GROUP BY r.region
ORDER BY total_orders_quantity DESC


set statistics io,time off