-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
select city.name from city 
join country
on city.countrycode=country.code where continent="Africa";

-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their 
-- respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
select Country.Continent,Floor(avg(CITY.POPULATION)) from Country 
JOIN CITY ON COUNTRY.CODE=CITY.COUNTRYCODE
group by Country.Continent;