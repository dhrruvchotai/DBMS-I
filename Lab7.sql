create table emp(
    EID INT,
	ENAME VARCHAR(50),
	DEPARTMENT VARCHAR(50),
	SALARY INT,
	JOININGDATE DATE,
	CITY VARCHAR(50)
);


	INSERT INTO emp VALUES(101,'rahul','admin',56000,'1990-01-01','rajkot')
	
	INSERT INTO emp VALUES(102, 'Hardik' ,'IT' ,18000 ,'1990-09-25','Ahmedabad')
	
	INSERT INTO emp VALUES(103 ,'Bhavin', 'HR', 25000 ,'1991-05-14', 'Baroda')
	
	INSERT INTO emp VALUES(104, 'Bhoomi' ,'Admin', 39000 ,'1991-02-08', 'Rajkot')
	
	INSERT INTO emp VALUES(105, 'Rohit', 'IT' ,17000 ,'1990-07-23', 'Jamnagar')
	
	INSERT INTO emp VALUES(106 ,'Priya', 'IT', 9000 ,'1990-10-18' ,'Ahmedabad')

	INSERT INTO emp VALUES(107, 'Bhoomi', 'HR' ,34000 ,'1991-12-25', 'Rajkot')

--Lab 7 
--Part – A:
--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
select max(salary) as Highest,min(salary) as Lowest from emp
--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal respectively.
select sum(salary) as Total_Sal , avg(salary) as Avg_Sal from emp
--3. Find total number of employees of EMPLOYEE table.
select count(*) as total_emp from emp 
--4. Find highest salary from Rajkot city.
select max(salary) as max_sal from emp where city='rajkot'
--5. Give maximum salary from IT department.
select max(salary) as max_sal from emp where DEPARTMENT='IT'
--6. Count employee whose joining date is after 8-feb-91.
select count(*)  as total_emp from emp where JOININGDATE > '1991-02-08'
--7. Display average salary of Admin department.
select avg(salary) as avg_sal from emp where DEPARTMENT='admin'
--8. Display total salary of HR department.
select sum(salary) as total_sal from emp where DEPARTMENT='HR'
--9. Count total number of cities of employee without duplication.\
select count(distinct city) as total_city from emp
--10. Count unique departments.
select count(distinct department) as dep from emp
--11. Give minimum salary of employee who belongs to Ahmedabad.
select min(salary) as min_sal from emp where city='ahmedabad'
--12. Find city wise highest salary.
select city,max(salary) as max_sal from emp group by city
--13. Find department wise lowest salary.
select DEPARTMENT,min(salary) as min_sal from emp group by DEPARTMENT
--14. Display city with the total number of employees belonging to each city.
select city,count(city) as total_emp from emp group by city
--15. Give total salary of each department of EMP table.
select DEPARTMENT,sum(SALARY) as total_sal from emp group by DEPARTMENT
--16. Give average salary of each department of EMP table without displaying the respective department name.
select avg(salary) as avg_sal from emp group by DEPARTMENT

--Part – B:
--1. Count the number of employees living in Rajkot.
select count(city) from emp where city='rajkot'
--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
select (max(salary) - min(salary)) as diff from emp
--3. Display the total number of employees hired before 1st January, 1991.select count(eid) from emp where JOININGDATE < '1991-01-01'--Part – C:
--1. Count the number of employees living in Rajkot or Baroda.
select count(eid) from emp where city='rajkot' or city = 'baroda'
--2. Display the total number of employees hired before 1st January, 1991 in IT department.
select count(eid) from emp where JOININGDATE < '1991-01-01' and DEPARTMENT = 'IT'
--3. Find the Joining Date wise Total Salaries.
select sum(salary) as total from emp group by JOININGDATE
--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
select max(salary) from emp where city like 'R%' group by DEPARTMENT