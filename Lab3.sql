create table CRICKET(
Name varchar(50),
City varchar(50),
Age int 
);

insert into CRICKET values('Sachin Tendulkar','Mumbai',30);
insert into CRICKET values('Rahul Dravid','Bombay',35);
insert into CRICKET values('M.S. Dhoni','Jharkhand',31);
insert into CRICKET values('Suresh Raina','Gujarat',30);

--Select into Operation
--Part – A:

--1. Create table Worldcup from cricket with all the columns and data.
select * into worldcup from cricket 
--2. Create table T20 from cricket with first two columns with no data.
select Name,City into T20 from Cricket where 11=12  
--3. Create table IPL From Cricket with No Data
select * into ipl from cricket where 1=2


--Update Operation
--Part – A:

--From the above given tables perform the following queries (UPDATE Operation):

--1. Update deposit amount of all customers from 3000 to 5000. (Use Deposit Table)
update deposit set amount = 5000 where amount = 3000
--2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table)
update borrow set bname = 'C.G.Road' where cname = 'anil' and bname = 'VRCE'
--3. Update Account No of SANDIP to 111 & Amount to 5000. (Use Deposit Table)
update deposit set actno=111, amount = 5000 where cname = 'sandip'
--4. Update amount of KRANTI to 7000. (Use Deposit Table)
update deposit set amount = 7000 where cname = 'kranti'
--5. Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table)
update branch set bname = 'andheri west' where bname = 'andheri'
--6. Update branch name of MEHUL to NEHRU PALACE. (Use Deposit Table)
update deposit set bname = 'nehru place' where cname = 'mehul'
--7. Update deposit amount of all depositors to 5000 whose account no between 103 & 107. (Use Deposit Table)
update deposit set amount = 5000 where actno between 103 and 107
--8. Update ADATE of ANIL to 1-4-95. (Use Deposit Table)
update deposit set adate = '1995-04-01' where cname = 'anil'
--9. Update the amount of MINU to 10000. (Use Deposit Table)
update deposit set amount = 10000 where cname = 'minu'
--10. Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96 (Use Deposit Table)
update deposit set amount = 5000, adate = '1996-04-01' where cname = 'pramod' 