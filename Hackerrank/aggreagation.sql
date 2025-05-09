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