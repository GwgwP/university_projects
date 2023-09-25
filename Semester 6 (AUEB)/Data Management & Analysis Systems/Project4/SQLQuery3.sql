create table person
(pid int primary key,
 pname varchar(50),
 age int,
 gender char(1)
);
create table cards
(cardno char(16) primary key,
 card_type varchar(20),
 card_brand varchar(30)
);
create table transactioninfo
(ttc int primary key,
 trans_type varchar(30)
);
create table timeinfo
(tdate datetime primary key,
 t_year int,
 t_month int,
 t_dayofmonth int,
 t_hour int,
 t_quarter int,
 t_week int,
 t_dayofyear int,
 t_dayofweek int
);
create table city
(mcc int primary key,
 merchant_city varchar(50)
);
create table transactions
( pid int ,
  cardno char(16) ,
  tdate datetime,
  ttc int ,
  mcc int ,
  amount decimal(6,2)

primary key(pid, cardno, tdate, ttc, mcc),
foreign key (pid) references person(pid),
foreign key (tdate) references timeinfo(tdate),
foreign key (cardno) references cards(cardno),
foreign key (ttc) references transactioninfo(ttc),
foreign key (mcc) references city(mcc)
);