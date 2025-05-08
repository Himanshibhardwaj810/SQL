-- Query all columns for all American cities in the CITY table with populations larger than 100000. 
-- The CountryCode for America is USA.
select * from CITY where population>100000 and CountryCode="USA";
select name from CITY where population>120000 and CountryCode="USA";

-- Query all columns (attributes) for every row in the CITY table.
select * from city;

-- Query a list of CITY names from STATION for cities that have an even ID number.
--  Print the results in any order, but exclude duplicates from the answer.
select distinct(city) from station where id%2=0;


-- Find the difference between the total number of CITY entries in the table and the
--  number of distinct CITY entries in the table.
select count(city)-count(distinct(city)) from station;

-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths 
select city,char_length(city) from station where char_length(city)=(select max(char_length(city)) from station)
order by city 
limit 1;
select city,char_length(city) from station where char_length(city)=(select min(char_length(city)) from station)
order by city 
limit 1;

-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot 
-- contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE 
  CITY LIKE 'A%' OR 
  CITY LIKE 'E%' OR 
  CITY LIKE 'I%' OR 
  CITY LIKE 'O%' OR 
  CITY LIKE 'U%';

-- Query the list of CITY names ending with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot 
-- contain duplicates

SELECT DISTINCT(CITY) FROM STATION 
WHERE CITY LIKE('%A') OR
CITY LIKE('%E') OR
CITY LIKE('%I') OR
CITY LIKE('%O') OR
CITY LIKE('%U');

--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first
-- and last characters. Your result cannot contain duplicate
SELECT DISTINCT CITY
FROM STATION
WHERE 
  CITY LIKE 'A%' OR 
  CITY LIKE 'E%' OR 
  CITY LIKE 'I%' OR 
  CITY LIKE 'O%' OR 
  CITY LIKE 'U%'
Intersect 
SELECT DISTINCT(CITY) FROM STATION 
WHERE CITY LIKE('%A') OR
CITY LIKE('%E') OR
CITY LIKE('%I') OR
CITY LIKE('%O') OR
CITY LIKE('%U');

-- Query the list of CITY names from STATION that do not start with vowels.
--  Your result cannot contain duplicates.


SELECT DISTINCT CITY
FROM STATION
WHERE 
 Not (CITY LIKE 'A%' OR 
  CITY LIKE 'E%' OR 
  CITY LIKE 'I%' OR 
  CITY LIKE 'O%' OR 
  CITY LIKE 'U%');


-- Query the list of CITY names from STATION that either do not start with vowels or do not end with 
-- vowels. Your result cannot contain duplicates.
select distinct city from station where Not((city like 'a%' or city like 'e%' or city like 'i%' or
 city like 'o%' or city like 'u%' ) AND(city like '%a' or city like '%e' or city like '%i' or
  city like '%o' or city like '%u' ) );

-- Query the list of CITY names from STATION that do not start with vowels and do not end with 
-- vowels. Your result cannot contain duplicates.
select distinct city from station where Not city like 'a%' and
Not city like 'e%' and
Not city like 'i%' and
Not city like 'o%' and
Not city like 'u%' and
Not city like '%a' and     
Not city like '%e' and
Not city like '%i' and
Not city like '%o' and
Not city like '%u' ;
-- this is strict not Query cities that do NOT start with vowels AND do NOT end with vowels.
-- This is a strict AND condition, not an OR or NOT(AND) case.

-- Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by 
-- the last three characters of each name. If two or more students both have names ending in
--  the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

select name from students where marks>75 
order by right(name,3) , id ;
-- The RIGHT() function in SQL extracts a specified number of characters
--  from the end (right side) of a string

-- Query the total population of all cities in CITY where District is California.
select sum(population) from city where district="California";

-- Query the average population for all cities in CITY, rounded down to the nearest integer.
select floor(avg(population)) from city ;

-- Query the difference between the maximum and minimum populations in CITY.
select max(population)-min(population) from city;