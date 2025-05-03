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