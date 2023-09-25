SELECT c.merchant_city AS City, SUM(t.amount) AS TotalTransactionValue
FROM transactions t
JOIN city c ON t.mcc = c.mcc
GROUP BY c.merchant_city
ORDER BY c.merchant_city ASC;
