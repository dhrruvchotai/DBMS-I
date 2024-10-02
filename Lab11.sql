3 --lab11
create table stud_info(
	rno int primary key,
	name varchar(50),
	branch varchar(50),
);

insert into stud_info values (101,'Raju','CE');
insert into stud_info values (102,'Amit','CE');
insert into stud_info values (103,'Sanjay','ME');
insert into stud_info values (104,'Neha','EC');
insert into stud_info values (105,'Meera','EE');
insert into stud_info values (106,'Mahesh','ME');

create table Stud_results(
	rno int foreign key REFERENCES stud_info(rno),
	spi decimal(4,2),
);

insert into Stud_results values (101,8.8);
insert into Stud_results values (102,9.2);
insert into Stud_results values (103,7.6);
insert into Stud_results values (104,8.2);
insert into Stud_results values (105,7.0);
insert into Stud_results values (106,8.9);

create table EMPLOYEE_MASTER(
	EmployeeNo varchar(50),
	Name varchar(50),
	ManagerNo varchar(50),
);

insert into EMPLOYEE_MASTER values('E01','tarun',null);
insert into EMPLOYEE_MASTER values('E02','Rohan','E02');
insert into EMPLOYEE_MASTER values('E03','Priya','E01');
insert into EMPLOYEE_MASTER values('E04','Milan','E03');
insert into EMPLOYEE_MASTER values('E05','Jay','E01');
insert into EMPLOYEE_MASTER values('E06','Anjana','E04');

--Part – A:
--1. Combine information from student and result table using cross join or Cartesian product.
select * from stud_info cross join Stud_results;
--2. Perform inner join on Student and Result tables.
select* from stud_info as s inner join Stud_results as r on s.rno = r.rno;
--3. Perform the left outer join on Student and Result tables.
select* from stud_info as s left outer join Stud_results as r on s.rno=r.rno;
--4. Perform the right outer join on Student and Result tables.
select* from stud_info as s right outer join Stud_results as r on s.rno=r.rno;
--5. Perform the full outer join on Student and Result table
select *from stud_info as s full outer join stud_info as r on s.rno=r.Rno;
--6. Display Rno, Name, Branch and SPI of all students.
select s.rno,s.name,s.branch,r.spi from stud_info as s inner join Stud_results as r on s.rno=r.rno;
--7. Display Rno, Name, Branch and SPI of CE branch’s student only.
select s.rno,s.name,s.branch,r.spi from stud_info as s inner join Stud_results as r on s.rno=r.rno
where s.branch='ce';
--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
select s.rno,s.name,s.branch,r.spi from stud_info as s inner join Stud_results as r on s.rno=r.rno where s.branch='ec';
--9. Display average result of each branch.
select s.branch, avg(r.spi) as average from stud_info as s inner join Stud_results as r on s.rno=r.rno group by s.branch;
--10. Display average result of CE and ME branch
select s.branch, avg(r.spi) as average from stud_info as s inner join Stud_results as r on s.rno=r.rno group by s.branch
having s.branch='ce' or s.branch='me';

--Part – B:
--1. Display average result of each branch and sort them in ascending order by SPI.
select s.branch, avg(r.spi) as average from stud_info as s inner join Stud_results as r on s.rno=r.rno group by s.branch order by average;

--2. Display highest SPI from each branch and sort them in descending order.
select s.branch, max(r.spi) as maximum from stud_info as s inner join Stud_results as r on s.rno=r.rno group by s.branch order by maximum desc;

--c1. Retrieve the names of employee along with their manager’s name from the Employee table
select e.name as ename,m.name as mname from EMPLOYEE_MASTER e left outer join EMPLOYEE_MASTER m on e.EmployeeNo=m.managerno; 