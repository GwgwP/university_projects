checkpoint
dbcc dropcleanbuffers

CREATE INDEX idx_customers_custkey ON customers (custkey);

checkpoint
dbcc dropcleanbuffers

--Indexes for the orders table
CREATE INDEX idx_orders_custkey ON orders (custkey);
CREATE INDEX idx_orders_orderkey ON orders (orderkey);
CREATE INDEX idx_orders_orderdate ON orders (orderdate);

checkpoint
dbcc dropcleanbuffers

-- Indexes for the lineitem table
CREATE INDEX idx_lineitem_orderkey ON lineitem (orderkey);
CREATE INDEX idx_lineitem_shipdate ON lineitem (shipdate);

drop index  idx_customers_custkey ON customers
drop INDEX idx_orders_custkey ON orders
drop INDEX idx_orders_orderkey ON orders
drop INDEX idx_orders_orderdate ON orders
drop INDEX idx_lineitem_orderkey ON lineitem
drop INDEX idx_lineitem_shipdate ON lineitem