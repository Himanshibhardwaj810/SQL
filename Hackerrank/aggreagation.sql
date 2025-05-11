-- Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next
-- integer.The miscalculation is salaries without zeros
select ceil(avg(salary)-avg(replace(salary,'0',''))) from employees;

-- We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the
--  maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings 
--  for all employees as well as the total number of employees who have maximum total earnings. Then print these 
--  values as  space-separated integers.
select max(total_earnings),count(total_earnings) from(select
 months*salary as total_earnings from employee ) as earnings 
where total_earnings=(select max(months*salary) from employee);
--we cfreated the from select as we want the intermediate row to n=be created as virtual table

-- Query the following two values from the STATION table:

-- The sum of all values in LAT_N rounded to a scale of  decimal places.
-- The sum of all values in LONG_W rounded to a scale of  decimal places.
select round(sum(lat_N),2),round(sum(long_w),2) from station;

-- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345 .
-- Round your answer to  decimal places.
select round((long_w),4) from station where lat_n=(select max(lat_n) from station where lat_n<137.2345);

-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than
--  . Round your answer to  decimal places.
select round(long_w,4) from station where lat_n=(select min(lat_n) from station where lat_n>38.7780);

-- Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.
-- x₁ = min(LAT_N) ,                 y₁ = min(LONG_W)
-- x₂ = max(LAT_N) ,                 y₂ = max(LONG_W)
-- Distance=|x1-x2|+|y1-y2|
select round(abs(max(lat_n)-min(lat_n))+abs(max(long_w)-min(long_w)),4) from station;

-- Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.
select round(sqrt(power(max(lat_n)-min(lat_n),2)+power(max(long_w)-min(long_w),2)),4) from station;

--find median
select round(lat_n,4) from (
select lat_n,row_number()over(order by lat_n asc) as rank  from station) as numbered
where rank=(select floor((count(*)+1)/2) from station);

-- here row number will assign unique index to each row through which we can calculate the median
-- and AS is used to  assign name to the derived table without which sql doesn't recognize the query