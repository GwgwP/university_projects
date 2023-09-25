insert into customers
select distinct pid, pname, age, gender
from CardsTransactions;

insert into cards
select distinct cardno, card_type, card_brand
from CardsTransactions;


insert into transactioninfo select distinct ttc, location_code 
from CardsTransactions;


set datefirst 1;
insert into timeinfo
 select distinct dtm, datepart(year, dtm), datepart(month, dtm),
 datepart(day,dtm),datepart(hour, dtm),
 datepart(quarter,dtm), datepart(week,dtm),
 datepart(dayofyear,dtm),datepart(dw,dtm)
 from main;
insert into Sales
select receipt_no, customer_id, dtm, product_id, storecode,
 sum(quantity), sum(cost), sum(discount), sum(profit)
 from main
 group by receipt_no,customer_id, dtm, product_id, storecode