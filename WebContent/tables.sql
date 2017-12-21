create table LoginTable (Username varchar2(20), Password varchar2(20) ,LastLogin date,Role varchar2(20));
insert into LoginTable values('dteam','dteam', to_date('23-12-2017','DD-MM-YYYY'),'Cashier')
insert into LoginTable values('teamd','teamd', to_date('23-12-2017','DD-MM-YYYY'),'executive')

insert into LoginTable values('exe','exe', to_date('23-12-2017','DD-MM-YYYY'),'Executive')

select * from LoginTable where Username='teamd' and Password='teamd' and Role='Executive'
select to_char(sysdate,'DD-MM-YYYY') from dual;
select * from logintable
select LastLogin from LoginTable where Username='' and Password=? and Role=?


/*Use the following credentials for DB.
 * Username-EJ1370262
 * Password-EJ1370262
 * DBUtil is already written with these credentials*/

--Table to store Customer Details
/*Check all the constrains in the BROWSER SIDE using AngularJS */
CREATE TABLE Customer(
SSN_ID number(9) unique,
Customer_ID number(10) primary key,
Customer_Name varchar2(50),
age number(3),
address varchar2(100),
Message varchar2(100)
);

create sequence Customer_ID start with 1000 increment by 1;


--CUSTOMER support statements.
select * from CUSTOMER;
drop table CUSTOMER;
drop table account;
drop sequence Account_ID;
--Table to STORE all LOGIN CREDENTIALS.
/*Check all the constrains in the BROWSER SIDE using AngularJS*/






--Table for Account Status.
create table Account(
Customer_ID number(10) ,
Account_ID number(10) primary key,
Account_Type varchar2(20),
Balance number(10,2),
Status varchar2(20),
Message varchar2(50),
Last_Updated TIMESTAMP,
foreign key(Customer_ID) references Customer(Customer_ID)
);


create sequence Account_ID start with 000657000 increment by 1;

insert into Account values(1000,441258,'savings',25,'InActive','created',TO_TIMESTAMP('2017-12-13 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'))
select * from Account
select Customer_ID from Customer order by Customer_ID;
select SSN_ID from Customer order by Customer_ID;
-- Account Status support statements.
select * from Account;
drop table Account;
drop sequence Customer_ID;
select sysdate from dual
select (to_date('12-12-2017','dd-MM-yyyy')-to_date('09-12-2017','dd-MM-yyyy')) as diff from dual
create table transaction(transactionDescription varchar2(100),transactiondate date,status varchar2(40),amount number(15,3),Account_ID number(10), foreign key(Account_ID) references Account(Account_ID) );
insert into transaction values('debit', to_date('2017-12-08','YYYY-MM-DD') ,'debit',110,345678);
select count(*) from TRANSACTION where transactiondate>=to_date('2017-12-10','YYYY-MM-DD') and transactiondate<=to_date('2017-12-11','YYYY-MM-DD')
select * from TRANSACTION;
drop table TRANSACTION;

create table samd(name varchar2(25), age number(10) default 20)
insert into samd(name) values('pqr')
select * from samd 
drop table logintable;

update ACCOUNT set status='InActive' where status='Inactive';
