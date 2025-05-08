-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.

select case
when a+b<=c or b+c<=a or a+c<=b then "Not A Triangle"
when a=b and b=c and c=a then "Equilateral"
when a=b or b=c or c=a then "Isosceles"
else "Scalene"
end as Triangle_type
from Triangles;

-- In any triangle, the sum of the lengths of any two sides must be greater than the length of the third side.
-- The condition
-- A + B > C AND A + C > B AND B + C > A

-- Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
-- Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

-- There are a total of [occupation_count] [occupation]s.
-- where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
select 
case 
when occupation="Doctor" then Concat(name,"(D)")
when occupation="Actor" then Concat(name,"(A)")
when occupation="Singer" then Concat(name,"(S)")
else Concat(name,"(P)")
end as Occupation_type
from occupations
order by name;

select concat("There are a total of ",count(occupation)," ",lower(occupation),"s.") from occupations 
group by occupation
order by count(occupation),occupation ;