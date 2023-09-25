CREATE INDEX index_on_orders ON orders (orderdate) include(custkey)

CREATE INDEX index_on_lineitem ON lineitem (shipdate) include(price);

CREATE INDEX index_on_cust ON customers (cname)