--lab 10
create table student_info(
Rno int,
name varchar(50),
branch varchar(50),
spi decimal(10,2),
Blog int,

);
insert into student_info values(101,'Raju','CE',8.80,0);
insert into student_info values(102,'Amit','CE',2.20 ,3);
insert into student_info values(103,'Sanjay','ME',1.50,6);
insert into student_info values(104,'Neha','EC',7.65,1);
insert into student_info values(105,'Meera','EE',5.52,2);
insert into student_info values(106,'Mahesh','EC',4.50,3);

--partA
--1. Create a view Personal with all columns.
create view  personal as select* from student_info; 
--2. Create a view Student_Details having columns Name, Branch & SPI.
create view student_details as select name,branch,spi from student_info;
--3. Create a view AcademicData having columns RNo, Name, Branch.
create view academicdata as select rno,name,branch from student_info;
--4. Create a view Student_ bklog having all columns but students whose bklog more than 2.
create view  Student_ bklog as select * from student_info
where Blog>2;

--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four
--letters.
create view Student_Pattern as select RNo, Name, Branch from student_info
where name like'____';

--6. Insert a new record to AcademicData view. (107, Meet, ME)
insert into academicdata values(107, 'Meet', 'ME');
--7. Update the branch of Amit from CE to ME in Student_Details view.
update student_details set branch='ce' where branch='me' and name='amit';
--8. Delete a student whose roll number is 104 from AcademicData view.
delete from academicdata where rno=104;

--Part – B:
--1. Create a view that displays information of all students whose SPI is above 8.5
create view stu_info as select* from student_info where spi>8.5;
--2. Create a view that displays 0 backlog students.
create view stu_bklg as select* from student_info where Blog=0;

--3. Create a view Computerview that displays CE branch data only.
create view Computerview as select* from student_info where branch='ce';

--Part – C:
--1. Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC.
create view Result_EC as select name,spi from student_info where spi<5 and branch='ec';

--2. Update the result of student MAHESH to 4.90 in Result_EC view.
update Result_EC set spi =4.90 where name='mahesh';

--3. Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having
--bklogs more than 5.
create view Stu_Bklog as select RNo, Name, Blog from student_info where name like'm%' and Blog>5;

--4. Drop Computerview form the database.
drop view Computerview;