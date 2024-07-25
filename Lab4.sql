--Alter Operation

--Part – A:
--1. Add two more columns City VARCHAR (20) and Pincode INT.
alter table deposit add city varchar(20),pincode int
--2. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).
alter table deposit alter column cname varchar(35)
--3. Change the data type DECIMAL to INT in amount Column.
alter table deposit alter column amount int
--4. Rename Column ActNo to ANO.
SP_RENAME 'deposit.ACTNO' , 'ANo'
--5. Delete Column City from the DEPOSIT table.
alter table deposit drop column city
--6. Change name of table DEPOSIT to DEPOSIT_DETAIL.
SP_RENAME 'DEPOSIT' , 'deposit_detail'

--Part – B:

--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.
SP_RENAME 'deposit_detail.ADATE' , 'aopendate'
--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table.
alter table deposit_detail drop column aopendate
--3. Rename Column CNAME to CustomerName.
sp_rename 'deposit_detail.CNAME' , 'CustomerName'

--DELETE, Truncate, Drop Operation

--Part – A:

--1. Delete all the records of DEPOSIT_DETAIL table having amount greater than and equals to 4000.
delete from deposit_detail where amount >= 4000
--2. Delete all the accounts CHANDI BRANCH.
delete from deposit_detail  where bname = 'chandi'
--3. Delete all the accounts having account number (ANO) is greater than 105.
delete from deposit_detail where ANo > 105
--4. Delete all the records of Deposit_Detail table. (Use Truncate)
truncate  table deposit_detail
--5. Remove Deposit_Detail table. (Use Drop)
drop table deposit_detail

create table employee_master(
    empno INT,
	empname VARCHAR(25),
	joiningdate DATETIME,
	salary DECIMAL(8,2),
	city VARCHAR(20)
);

insert into employee_master values (101,'keyur','2002-1-5',12000,'rajkot')
insert into employee_master values (102,'hardik','2004-2-15',14000,'ahmedabad')
insert into employee_master values (103,'kajal','2006-3-14',15000,'baroda')
insert into employee_master values (104,'bhoomi','2005-6-23',12500,'ahmedabad')
insert into employee_master values (105,'harmit','2004-2-15',14000,'rajkot')
insert into employee_master values (106,'mitesh','2001-9-25',5000,'jamnagar')
insert into employee_master values (107,'meera',null,7000,'morbi')
insert into employee_master values (108,'kishan','2003-2-6',10000,null)



--Part – B:

--1. Delete all the records of Employee_MASTER table having salary greater than and equals to 14000.
delete from employee_master where salary >= 14000
--2. Delete all the Employees who belongs to ‘RAJKOT’ city.
delete from employee_master where city = 'rajkot'
--3. Delete all the Employees who joined after 1-1-2007.
delete from employee_master where joiningdate > '2007-1-1'
--4. Delete the records of Employees whose joining date is null and Name is not null.
delete from employee_master where joiningdate = null and not empname is null
--5. Delete the records of Employees whose salary is 50% of 20000.
delete from employee_master where salary = (0.5*20000)
--6. Delete the records of Employees whose City Name is not empty.
delete from employee_master where not city is null
--7. Delete all the records of Employee_MASTER table. (Use Truncate)
truncate table employee_master 
--8. Remove Employee_MASTER table. (Use Drop)
drop table employee_master 


