--Perform SQL queries for Like operator
--Part – A:create table student(
	stuid INT,
	firstname VARCHAR(25),
	lastname VARCHAR(25),
	website VARCHAR(50),
	city VARCHAR(25),
	address VARCHAR(50),
);

	INSERT INTO student VALUES(1011,'Keyur','Patel', 'techonthenet.com' , 'Rajkot' ,'A-303 ''Vasant Kunj'', Rajkot')
	
	INSERT INTO student VALUES(1022,'Hardik','Shah', 'digminecraft.com' , 'Ahmedabad' ,'"Ram Krupa", Raiya Road')

	INSERT INTO student VALUES(1033,'Kajal','Trivedi', 'bigactivities.com' , 'Baroda' ,'Raj bhavan plot, near garden')

	INSERT INTO student VALUES(1044,'Bhoomi','Gajera', 'checkyourmath.com' , 'Ahmedabad' ,'"Jig’s Home", Narol')

	INSERT INTO student VALUES(1055,'Harmit','Mitel', '@me.darshan.com' , 'Rajkot' ,'B-55, Raj Residency')
	
	INSERT INTO student VALUES(1066,'Ashok','Jani', null , 'Baroda' ,'A502, Club House Building')



	--1. Display the name of students whose name starts with ‘k’.
	select firstname from student where firstname like 'k%'
	--2. Display the name of students whose name consists of five characters.
	select firstname from student where firstname like '_____'
	--3. Retrieve the first name & last name of students whose city name ends with a & contains six characters.
	select firstname,lastname from student where city like '_____a'
	--4. Display all the students whose last name ends with ‘tel’.
	select * from student where lastname like '%tel'
	--5. Display all the students whose first name starts with ‘ha’ & ends with‘t’.
	select * from student where firstname like 'ha%t'
	--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’.
	select * from student where firstname like 'k_y%'
	--7. Display the name of students having no website and name consists of five characters.
	select firstname from student where website is null and firstname like '_____'
	--8. Display all the students whose last name consist of ‘jer’.
	select * from student where lastname like '%jer%'
	--9. Display all the students whose city name starts with either ‘r’ or ‘b’.
	select * from student where city like '[rb]%'
	--10. Display all the name students having websites.
	select * from student where not website is null
	--11. Display all the students whose name starts from alphabet A to H.
	select * from student where firstname like '[a-h]%'
	--12. Display all the students whose name’s second character is vowel.
	select * from student where city like '_[aeiou]%'
	--13. Display the name of students having no website and name consists of minimum five characters.
	select * from student where website is null and firstname like '_____' 
	--14. Display all the students whose last name starts with ‘Pat’.
	select * from student where lastname like 'pat%'
	--15. Display all the students whose city name does not starts with ‘b’.	select * from student where not city like 'b%'

	--Part – B:
	--1. Display all the students whose name starts from alphabet A or H.
		select * from student where firstname like '[ah]%'
	--2. Display all the students whose name’s second character is vowel and of and start with H.
		select * from student where firstname like 'h[aeiou]%'
	--3. Display all the students whose last name does not ends with ‘a’.
		select * from student where not lastname like '%a'
	--4. Display all the students whose first name starts with consonant.
		select * from student where firstname not like '[aeiou]%' 
	--5. Display all the students whose website contains .net
		select * from student where website like '%.net%'

	--Part – C:
		--1. Display all the students whose address consist of -.
		select * from student where address like '%-%'
		--2. Display all the students whose address contains single quote or double quote.
		select * from student where address like '%[''""]%'
		--3. Display all the students whose website contains @.
		select * from student where website like '%@%'
		--4. Display all the names those are either four or five characters.		select * from student where firstname like '____' or firstname like '_____'

