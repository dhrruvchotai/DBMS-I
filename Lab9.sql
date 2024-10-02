CREATE TABLE City (
    CityID INT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE,
    Pincode INT NOT NULL,
    Remarks VARCHAR(255)
);

CREATE TABLE Village (
    VID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

INSERT INTO City (CityID, Name, Pincode, Remarks) VALUES
(1, 'Rajkot', 360005, 'Good'),
(2, 'Surat', 335009, 'Very Good'),
(3, 'Baroda', 390001, 'Awesome'),
(4, 'Jamnagar', 361003, 'Smart'),
(5, 'Junagadh', 362229, 'Historic'),
(6, 'Morvi', 363641, 'Ceramic');

INSERT INTO Village (VID, Name, CityID) VALUES
(101, 'Raiya', 1),
(102, 'Madhapar', 1),
(103, 'Dodka', 3),
(104, 'Falla', 4),
(105, 'Bhesan', 5),
(106, 'Dhoraji', 5);

--1. Display all the villages of Rajkot city.
select Village.name from Village join City on Village.CityID=City.CityID where City.Name='rajkot';
--2. Display city along with their villages & pin code.
select City.name,Village.Name,City.Pincode from Village join City on Village.CityID=City.CityID;

--3. Display the city having more than one village.
select City.name from Village join City on Village.CityID=City.CityID group by City.Name having COUNT(Village.Name)>1;

--4. Display the city having no village.
select City.name from City left join Village on Village.CityID=City.CityID group by City.Name having COUNT(Village.Name)=0;

--5. Count the total number of villages in each city.
select City.name,COUNT(Village.Name) from Village join City on Village.CityID=City.CityID group by City.Name;

--6. Count the number of cities having more than one village.
select COUNT(City.CityID)
from City
where City.CityID in (select City.CityID from City join Village on Village.CityID=City.CityID group by City.CityID having COUNT(Village.Name)>1);


CREATE TABLE stu_master(
	rno int primary key,
	name varchar(50),
	branch varchar(50) default 'general',
	spi decimal(4,2) check (spi>0 and spi<=10),
	bklg int check(bklg>0)
);

insert into stu_master (rno,name,branch,spi,bklg) values
(101,'Raju','ce',8.80,5),
(102,'amit','ce',2.20,3),
(106,'mahesh',default,4.50,3);





--part B
CREATE TABLE Dept_DETAILS (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL
);

CREATE TABLE City_DETAILS(
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL
);

CREATE TABLE Emp_DETAILS (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10, 2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0), 
    FOREIGN KEY (Did) REFERENCES Dept_DETAILS(Did),
    FOREIGN KEY (Cid) REFERENCES City_DETAILS(Cid)
);

INSERT INTO Dept_DETAILS(Did, Dname) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing');

INSERT INTO City_DETAILS(Cid, Cname) VALUES
(1, 'New York'),
(2, 'Los Angeles'),
(3, 'Chicago');

INSERT INTO Emp_DETAILS(Eid, Ename, Did, Cid, Salary, Experience) VALUES
(1, 'John Doe', 1, 1, 50000.00, 5),
(2, 'Jane Smith', 2, 2, 75000.00, 8),
(3, 'Mike Johnson', 3, 3, 60000.00, 3);

---------------------------------------------------------------------------------------------------------
--lab9
CREATE TABLE Stu_Detail (
    Rno INT,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT,
);

INSERT INTO Stu_Detail (Rno, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

CREATE TABLE Academic (
    Rno INT,
    SPI DECIMAL(3, 1),
    Bklog INT
);

INSERT INTO Academic (Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

CREATE TABLE Department (
    DID INT,
    DName VARCHAR(50)
);

INSERT INTO Department (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical');

--Part – A:
--1. Display details of students who are from computer department.
select *from Stu_Detail join Department on Stu_Detail.DID=Department.DID where Department.DName='computer';
--2. Displays name of students whose SPI is more than 8.
select name from Stu_Detail where Stu_Detail.Rno in (select Rno from Academic where spi>8);
--3. Display details of students of computer department who belongs to Rajkot city.
select name from Stu_Detail where did in(select did from Department where DName='computer') and City='rajkot';
--4. Find total number of students of electrical department.
select COUNT(did) from Stu_Detail where did in (select did from Department where DName='electrical');
--5. Display name of student who is having maximum SPI.
select name from stu_detail where rno in (select rno from Academic where spi = (select max(spi) from Academic))
--6. Display details of students having more than 1 backlog.
select *from Stu_Detail where rno in (select rno from Academic where Bklog>0);