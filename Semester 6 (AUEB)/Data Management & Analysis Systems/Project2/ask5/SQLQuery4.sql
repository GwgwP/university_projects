
checkpoint dbcc dropcleanbuffers
set statistics io, time on

SELECT n.nation,  COUNT(c.custkey) as number_of_customers, SUM(c.c_acctbal) AS total_account_balance_of_customers
FROM customers c
JOIN nations n ON c.nationkey = n.nationkey
WHERE n.nation IN (
  SELECT TOP 7 n.nation
  FROM customers c
  JOIN nations n ON c.nationkey = n.nationkey
  GROUP BY n.nation
  ORDER BY SUM(c.c_acctbal) DESC
)
GROUP BY n.nation
ORDER BY total_account_balance_of_customers DESC;

set statistics io, time off
