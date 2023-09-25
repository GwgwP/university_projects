--Parts sto psize, ptype include manufacturer 
--create index index_on_parts on parts (ptype, psize) include (manufacturer)
--create index index_on_suppliers on suppliers (nationkey) include(s_acctbal, sname, sphone, s_comment)



--Index sto suppkey toy partsupp include supplycost
--create index index_on_partsèðð on partsupp (suppkey) include (partkey, supplycost)

--ETOIMA2
--create index index_on_parts1 on parts (psize, partkey) 
--create index index_on_parts2 on parts (ptype, partkey) include (manufacturer)

--CREATE INDEX index_on_suppliers on suppliers (nationkey, suppkey) include (sname, sphone, s_acctbal, s_comment)
--CREATE INDEX index_on_suppliers2 on suppliers (s_acctbal, suppkey) 
--CREATE INDEX index_on_suppliers3 on suppliers (sname, suppkey) 

--create index index_on_suppliers on suppliers (s_acctbal, nationkey, sname)-- include (sphone, s_comment)
--create index index_on_partsupp on partsupp (supplycost)
--create index index_on_parts on parts (ptype, psize) include (manufacturer)

--create index Q4_idx1 on parts(brand, partkey) include (pname)
--create index Q4_idx2 on parts(manufacturer, partkey) include (pname)
--CREATE INDEX idx_covering ON parts (brand, manufacturer, partkey, pname)

--CREATE INDEX index_on_parts ON parts (manufacturer, brand, partkey) INCLUDE (pname)

--create index Q4_idx1 on parts(brand, partkey) include (pname)
--create index Q4_idx2 on parts(manufacturer, partkey) include (pname)

-- Index for orders table
--drop INDEX idx_orders_orderdate ON orders --(orderdate) includ;



-- Index for customers and nations tables
--drop INDEX idx_customers_nationkey ON customers-- (nationkey);



-- Index for lineitem and orders tables
--drop INDEX idx_lineitem_orderkey_discount_price_quantity ON lineitem --(orderkey, discount, price, quantity);

-- Index for orders table
create INDEX idx_orders_orderdate ON orders (orderdate) INCLUDE (custkey);


-- Index for customers and nations tables
create INDEX index_on_customers_nationkey ON customers (nationkey) INCLUDE (custkey);
create INDEX index_on_customers_custkey ON customers (custkey) INCLUDE (cname);

-- Index for lineitem table

-- Index for lineitem and orders tables
create INDEX index_on_lineitem ON lineitem (orderkey) INCLUDE (discount, price, quantity);

