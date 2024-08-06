create table SALES_DATA(
	REGION VARCHAR(50),
	PRODUCT VARCHAR(50),
	SALESAMT INT,
	YEAR INT
);


INSERT INTO SALES_DATA values ('North America', 'Watch' ,1500 ,2023)

INSERT INTO SALES_DATA values ('Europe' ,'Mobile', 1200 ,2023)

INSERT INTO SALES_DATA values ('asia', 'watch' ,1800 ,2023)

INSERT INTO SALES_DATA values ('North America' ,'TV' ,900 ,2024)

INSERT INTO SALES_DATA values ('Europe' ,'Watch' ,2000 ,2024)

INSERT INTO SALES_DATA values ('Asia', 'Mobile', 1000, 2024)

INSERT INTO SALES_DATA values ('North America' ,'Mobile' ,1600 ,2023)

INSERT INTO SALES_DATA values ('Europe' ,'TV', 1500, 2023)

INSERT INTO SALES_DATA values ('Asia' ,'TV' ,1100 ,2024)

INSERT INTO SALES_DATA values ('North America','Watch',1700, 2024)

--Part – A:
--1. Display Total Sales Amount by Region.
select region,sum(SALESAMT) as total from SALES_DATA group by REGION

--2. Display Average Sales Amount by Product
select product,avg(SALESAMT) as avg from SALES_DATA group by product

--3. Display Maximum Sales Amount by Year
select year,max(SALESAMT) as maximum from SALES_DATA group by YEAR

--4. Display Minimum Sales Amount by Region and Year
select region,year,min(SALESAMT) as minimum from SALES_DATA group by region,YEAR

--5. Count of Products Sold by Region
select count(PRODUCT) as count_product from SALES_DATA group by region

--6. Display Sales Amount by Year and Product
select year,product,sum(SALESAMT) from SALES_DATA group by year,product

--7. Display Regions with Total Sales Greater Than 5000
select region from SALES_DATA group by region having sum(SALESAMT) > 5000

--8. Display Products with Average Sales Less Than 10000
select PRODUCT from SALES_DATA group by product having avg(SALESAMT) < 10000

--9. Display Years with Maximum Sales Exceeding 500
select YEAR,max(SALESAMT) from SALES_DATA  group by year having max(SALESAMT) > 500

--10. Display Regions with at Least 3 Distinct Products Sold.
select region from SALES_DATA group by region having count(distinct PRODUCT) > 2

--11. Display Years with Minimum Sales Less Than 1000
select year from SALES_DATA group by year having min(SALESAMT) < 1000

--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount
select 
	sum(SALESAMT) 
	FROM SALES_DATA 
	where year = 2023
	group by region 
	order by sum(SALESAMT)

--Part – B:
--1. Display Count of Orders by Year and Region, Sorted by Year and Region
select year,region,count(PRODUCT) from SALES_DATA group by year,region order by year,region

--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region
select region,max(salesamt) 
from SALES_DATA 
GROUP BY region having max(salesamt) > 1000 
order by region

--3. Display Years with Total Sales Amount Less Than 1000, Sorted by Year Descending
select year,sum(salesamt) from SALES_DATA group by year having sum(salesamt) < 1000 order by year DESC

--4. Display Top 3 Regions by Total Sales Amount in Year 2024
select TOP 3 REGION , sum(salesamt) 
	from SALES_DATA  
	WHERE YEAR = 2024 
	GROUP BY REGION 
	order by sum(salesamt) desc

--Part – C:
--1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name
SELECT PRODUCT,avg(salesamt) FROM SALES_DATA group by product having avg(salesamt) between 1000 and 2000 order by PRODUCT

--2. Display Years with More Than 5 Orders from Each Region
SELECT year,region,COUNT(PRODUCT) as count from SALES_DATA group by year,region having Count(product) > 5

--3. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending.
select region from SALES_DATA where year = 2023 group by region having avg(salesamt) > 1500 order by avg(salesamt) DESC

--4. Find out region wise duplicate product.
select PRODUCT,region from SALES_DATA group by region,PRODUCT HAVING COUNT(product) > 1 

--5. Find out region wise highest sales amount.
select region,max(salesamt) from SALES_DATA GROup by region 