create table person
(pid int primary key,
 pname varchar(50),
 age int,
 gender char(1)
);

insert into person select distinct pid, pname, age, gender from CardsTransactions 

----------------------------------------------------------------------------------

create table cards
(cardno char(16) primary key,
 card_type varchar(20),
 card_brand varchar(30)
);

insert into cards select distinct cardno, card_type, card_brand from CardsTransactions 

----------------------------------------------------------------------------------

create table transactioninfo
(ttc int primary key,
 trans_type varchar(30)
);

insert into transactioninfo select distinct ttc, trans_type from CardsTransactions 

----------------------------------------------------------------------------------

create table timeinfo
(time_key datetime primary key,
 t_year int,
 t_month int,
 t_dayofmonth int,
 t_hour int,
 t_quarter int,
 t_week int,
 t_dayofyear int,
 t_dayofweek int
);

set datefirst 1;
insert into timeinfo select distinct tdate, datepart(year, tdate), datepart(month, tdate), datepart(day,tdate),datepart(hour, tdate), 
                datepart(quarter,tdate), datepart(week,tdate),datepart(dayofyear,tdate),datepart(dw,tdate)
 from CardsTransactions order by tdate
----------------------------------------------------------------------------------
create table city
(mcc int primary key,
 merchant_city varchar(50)
);

insert into city select distinct mcc, merchant_city from CardsTransactions

----------------------------------------------------------------------------------

create table transactions
( pid int ,
  cardno char(16) ,
  time_key datetime,
  ttc int ,
  mcc int ,
  amount decimal(6,2)

primary key(pid, cardno, time_key, ttc, mcc),
foreign key (pid) references person(pid),
foreign key (time_key) references timeinfo(time_key),
foreign key (cardno) references cards(cardno),
foreign key (ttc) references transactioninfo(ttc),
foreign key (mcc) references city(mcc)
);

INSERT INTO transactions
SELECT  pid, cardno, tdate, ttc, mcc, sum(amount) 
   from CardsTransactions  
GROUP BY  pid, cardno, tdate, ttc, mcc