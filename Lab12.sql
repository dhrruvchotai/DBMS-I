	CREATE TABLE Dept (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);
CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT NULL,
    Salary DECIMAL(8, 2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(100) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Dept(DepartmentID)
);

INSERT INTO Dept (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block');

INSERT INTO Person (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES
(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');

--Part – A:
--1. Find all persons with their department name & code.
 select dept.departmentcode, dept.departmentname from dept join person on Person.departmentid= dept.departmentid;
--2. Find the person's name whose department is in C-Block.
select person.PersonName from person join  dept on Person.DepartmentID = dept.DepartmentID where dept.Location='c-block';
--3. Retrieve person name, salary & department name who belongs to Jamnagar city.
select person.PersonName,Person.Salary,dept.DepartmentName from person join  dept on Person.DepartmentID = dept.DepartmentID where person.City = 'jamnagar';
--4. Retrieve person name, salary & department name who does not belong to Rajkot city.
select person.PersonName,Person.Salary,dept.DepartmentName from person join  dept on Person.DepartmentID = dept.DepartmentID where person.City <> 'rajkot';
--5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001.
select person.PersonName from person join  dept on Person.DepartmentID = dept.DepartmentID where dept.DepartmentName='civil' and person.JoiningDate >'2001-08-01';
--6. Find details of all persons who belong to the computer department
select *from Dept join Person on person.DepartmentID=dept.DepartmentID where dept.DepartmentName='computer';
--7. Display all the person's name with the department whose joining date difference with the current date
--is more than 365 days.
select person.PersonName,dept.DepartmentName from person join Dept on person.DepartmentID=dept.DepartmentID where DATEDIFF(day,person.joiningdate,GETDATE())>365;
--8. Find department wise person counts.
select dept.DepartmentName,count(person.PersonID) from person join Dept on person.DepartmentID=dept.DepartmentID group by dept.DepartmentName;
--9. Give department wise maximum & minimum salary with department name.
select dept.DepartmentName,max(Person.Salary),min(Person.Salary) from person join Dept on person.DepartmentID=dept.DepartmentID group by dept.DepartmentName;
--10. Find city wise total, average, maximum and minimum salary.
select max(Person.Salary),min(Person.Salary),avg(person.Salary) from person group by person.City;
--11. Find the average salary of a person who belongs to Ahmedabad city.
select avg(person.Salary) from person where person.City = 'rajkot';
--12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In
--single column
select CONCAT(person.PersonName,' lives in ',person.city,' and works in ', dept.DepartmentName,' dept ') from person join dept on person.DepartmentID=dept.DepartmentID;

--Part – B:
--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In
--single column)
select CONCAT(person.PersonName,' earns ',person.Salary,' from ', dept.DepartmentName,' department monthly ') from person join dept on person.DepartmentID=dept.DepartmentID;
--2. Find city & department wise total, average & maximum salaries.
select sum(person.salary),avg(person.salary),max(person.salary) from person join dept on person.departmentid = dept.DepartmentID group by person.City,dept.DepartmentName;
--3. Find all persons who do not belong to any department.
select *from person  where Person.DepartmentID is null;
--4. Find all departments whose total salary is exceeding 100000.
select dept.DepartmentName from Dept join person on person.DepartmentID = dept.DepartmentID group by dept.DepartmentName having sum(person.salary)>100000;