--Parts sto psize, ptype include manufacturer 
--create index index_on_parts on parts (ptype, psize) include (manufacturer)
--create index index_on_suppliers on suppliers (nationkey) include(s_acctbal, sname, sphone, s_comment)

--SIGOURAKI GIA TO 3 c
--reate index index_on_orders on orders (orderdate, custkey) include (orderdate, custkey,totalprice) --657



--Index sto suppkey toy partsupp include supplycost
--create index index_on_orders on orders (orderdate, custkey) include (totalprice) --657

create index index_on_orders on orders (orderdate, custkey) include (totalprice)

create index index_on_customers on customers (market_segment, custkey) 

