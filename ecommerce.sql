create database ecommercedb;

use ecommercedb;


create table supplier(SUPP_ID int primary key,SUPP_NAME varchar(50) not null,SUPP_CITY varchar(50) not null,SUPP_PHONE varchar(50) not null);

desc supplier;

create table customer(CUS_ID int primary key,CUS_NAME varchar(20) not null,CUS_PHONE varchar(10) not null
,CUS_CITY varchar(30) not null,CUS_GENDER char);

desc customer;

create table category(CAT_ID int primary key,CAT_NAME varchar(20) not null);

desc category;

create table product(PRO_ID int primary key,PRO_NAME varchar(20) not null default "dummy",PRO_DESC varchar(60),
CAT_ID int,foreign key(CAT_ID) references category(CAT_ID));

desc product;

create table supplier_pricing(PRICING_ID int primary key,PRO_ID int,SUPP_ID int,SUPP_PRICE int default 0,
foreign key(PRO_ID) references product(PRO_ID),foreign key(SUPP_ID) references supplier(SUPP_ID));

desc supplier_pricing;

create table `order`(ORD_ID int primary key,ORD_AMOUNT int not null,ORD_DATE date not null,CUS_ID int,
PRICING_ID int,foreign key(CUS_ID) references customer(CUS_ID),
foreign key(PRICING_ID) references supplier_pricing(PRICING_ID));

desc `order`;

create table rating(RAT_ID int primary key,ORD_ID int,RAT_RATSTARS int not null,
foreign key(ORD_ID) references `order`(ORD_ID));

desc rating;



INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');
INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');
INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");
INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);
INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);
INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);
INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

select * from supplier;
select * from CUSTOMER;
select * from CATEGORY;
select * from PRODUCT;
select * from SUPPLIER_PRICING;
select * from `ORDER`;
select * from RATING;

select count(T2.CUS_GENDER) as NoOfCustomers, T2.CUS_GENDER from
(select T1.CUS_ID, T1.CUS_GENDER, T1.CUS_NAME from
(select `order`.*, customer.CUS_GENDER, customer.CUS_NAME from `order` inner join customer where `order`.CUS_ID=customer.CUS_ID having
`order`.ORD_AMOUNT>=3000)
as T1 group by T1.CUS_ID) as T2 group by T2.CUS_GENDER;


select product.PRO_NAME, `order`.* from `order`, supplier_pricing, product
where `order`.CUS_ID=2 and
`order`.PRICING_ID=supplier_pricing.PRICING_ID and supplier_pricing.PRO_ID=product.PRO_ID;


select supplier.* from supplier where supplier.SUPP_ID in
(select SUPP_ID from supplier_pricing group by SUPP_ID having
count(SUPP_ID)>1)
group by supplier.SUPP_ID;


select category.CAT_ID,category.CAT_NAME, min(T3.min_price) as Min_Price from category inner join
(select product.CAT_ID, product.PRO_NAME, T2.* from product inner join
(select PRO_ID, min(SUPP_PRICE) as Min_Price from supplier_pricing group by PRO_ID)
as T2 where T2.PRO_ID = product.PRO_ID)
as T3 where T3.CAT_ID = category.CAT_ID group by T3.CAT_ID;


select product.PRO_ID,product.PRO_NAME from `order` inner join supplier_pricing on supplier_pricing.PRICING_ID=`order`.PRICING_ID inner join product
on product.PRO_ID=supplier_pricing.PRO_ID where `order`.ord_date>"2021-10-05";


select customer.CUS_NAME,customer.CUS_GENDER from customer where customer.CUS_NAME like 'A%' or customer.CUS_NAME like '%A';


use ecommercedb;


DELIMITER //
CREATE PROCEDURE proc()
BEGIN
select report.SUPP_ID,report.SUPP_NAME,report.Average,
CASE
WHEN report.Average =5 THEN 'Excellent Service'
WHEN report.Average >4 THEN 'Good Service'
WHEN report.Average >2 THEN 'Average Service'
ELSE 'Poor Service'
END AS Type_of_Service from
(select final.SUPP_ID, supplier.SUPP_NAME, final.Average from
(select test2.SUPP_ID, sum(test2.RAT_RATSTARS)/count(test2.RAT_RATSTARS) as Average from
(select supplier_pricing.SUPP_ID, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join
(select `order`.PRICING_ID, rating.ORD_ID, rating.RAT_RATSTARS from `order` inner join rating on rating.`ORD_ID` = `order`.ORD_ID ) as test
on test.PRICING_ID = supplier_pricing.PRICING_ID)
as test2 group by supplier_pricing.SUPP_ID)
as final inner join supplier where final.SUPP_ID = supplier.SUPP_ID) as report;
END 
//
DELIMITER ;


call proc();