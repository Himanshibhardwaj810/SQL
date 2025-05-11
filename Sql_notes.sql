/*SQL (Structured Query Language):
SQL is a standard programming language specifically designed for 
managing and manipulating databases. It allows users to interact with
 relational databases to perform tasks such as querying, updating,
 inserting, and deleting data. */
 /* select customer_id,customer_city, customer_state from ecommerce.customers;   TO RETRIEVE DESIRED COLUMNS*/ 
-- select statement is for retreiving columns
-- * means everything
-- SELECT col name FROM table name where Condition
/*Clause: in SQL is a built-in function that is used to retrieve the data from the records present in the
 database.*/
 /*
 i) where     ii)Group by         iii)order by
 /*
The WHERE clause is used in SQL to filter records that meet specific 
conditions. It is typically used in combination with SELECT, UPDATE, DELETE, 
and other SQL commands to specify which records you want to work with.

note=You cannot use an aggregate function (MAX, MIN, LEN) like that inside a
WHERE clause without using a subquery or CTE.
*/
-- select * from customers where customer_state="MG";
--       OPERATORS
/*
The BETWEEN operator is used to filter the result set within a specified range. It includes the 
boundary values.
column_name BETWEEN value1 AND value2
This checks whether the value in column_name is greater than or equal to value1 and less than or equal to value2.
SELECT * FROM payments WHERE payment_value BETWEEN 500 AND 1000;
*/
/* 
The NOT operator is used to negate a condition. It reverses the result of the condition.
NOT (condition);
SELECT * FROM payments WHERE NOT (payment_type = 'voucher');*/
/*
select * from payments where not((payment_type="UPI" or payment_type="credit_card") and payment_value>=1000);
/* NOT has the highest priority and will be evaluated first.
AND has a higher precedence than OR, so it will be evaluated before OR when no brackets are used.
OR has the lowest precedence, so it will be evaluated last unless brackets are used to explicitly change the order.
*/
/* 
The IN operator is used to check if a value matches any value in a list.
It’s a cleaner alternative to multiple OR conditions.
SELECT * FROM table_name
WHERE column_name IN (value1, value2, value3);
select * from customers where customer_state in( "TO","SP","Al");
*/
/*
The LIKE operator is used to search for a specified pattern in a column (usually text).
SELECT * FROM table_name
WHERE column_name LIKE 'pattern';
Ex-select * from customers where customer_city like "j%"; -- start with
select customer_city from customers where customer_city like "%i"; end with
Exactly one character	'A_'
-- Names with exactly 3 letters, starting with 'J'
SELECT * FROM customers 
WHERE customer_name LIKE 'J__';
*/
/*
The ORDER BY clause is used to sort the result set of a query by one or more columns.
Use ORDER BY at the end of your query, after WHERE, GROUP BY, or HAVING.
SELECT * FROM table_name
ORDER BY column_name [ASC | DESC]; -- by default asc
select * from payments  order by payment_value;

SELECT * FROM orders
ORDER BY order_date DESC, order_id ASC;
First, sort all rows by column1.
If some rows have the same value in column1, then sort those rows by column2.

You can sort using column position in SELECT (not recommended, but allowed):
SELECT customer_id, customer_name, customer_city
FROM customers
ORDER BY 2 ASC;  -- sorts by customer_name
*/
-- ctrl + B is used to beautify the code
/* 
The LIMIT operator is used to restrict the number of rows returned by a SQL query.
It controls how many results you get, especially useful when the dataset is large.
SELECT * FROM table_name
LIMIT number_of_rows; --number_of_rows → How many records you want.
-- if we don't add order by before limit then random rows will come
LIMIT with OFFSET (Advanced but easy):
Sometimes you want to skip some rows and then fetch rows.
That's where OFFSET is used.
Skip 10 rows, then show 5	SELECT * FROM employees LIMIT 5 OFFSET 10;
select * from payments limit 3,2;-- it will skip 3 entries and return 2 rows
*/

-- FUNCTIONS
-- 1) Aggregate functions
/* 
The SUM() function is used to add together (i.e., calculate the total of) the values in a numeric column.
"as " =is used to specify the name of the column
select sum(payment_value) as Aggregate_sum from payments;

Round functon is used to round off the value 
it take value as first parameter and the round off digit as 2nd parameter
select round(sum(payment_value),2) as Aggregate_sum from payments;
*/
/*
The DIFFERENCE() function is used to compare two strings and returns a value between 0 and 4 based on their
 phonetic similarity using the SOUNDEX algorithm.
SELECT DIFFERENCE('smith', 'smyth');  -- Returns 4 (very similar)
SELECT DIFFERENCE('smith', 'john');   -- Returns 0 (very different)
*/
/*
If you want to find the difference between integers in SQL, you simply use basic subtraction (-) — 
no special function is needed.
SELECT column1 - column2 AS difference
FROM table_name;
select count(city)-count(distinct(city)) from station;
*/
/* 
max function return maximum value
select max(payment_value) from payments;
*/
/* 
min function return minimum value
select min(payment_value) from payments;
*/
/* 
avg function return average value
select avg(payment_value) from payments;
*/
/*
The COUNT() function returns the number of rows that match a condition.
select count(customer_id) from customers;
In SQL, you cannot combine aggregates and non-aggregated columns without a GROUP BY.
*/
/*
The DISTINCT keyword is used to remove duplicates and return only unique values from a column.
select count(distinct customer_city) from customers;
SELECT DISTINCT city, state FROM customers;
*/

-- TEXT FUNCTION
/* 
The LENGTH() function returns the number of characters (or bytes, depending on DBMS) in a string.
SELECT LENGTH(column_name) FROM table_name;
SELECT name FROM customers WHERE LENGTH(name) > 10;

and char_length() is useed to retrieve the length of characters in string
*/
/*
The TRIM() function removes leading (start) and trailing (end) spaces from a string.
select customer_city,length(trim(customer_city)) from customers;
*/
/*
The UPPER AND LOWER function are used to convert  characters into uppercase and lowercase 
select upper(seller_city),lower(seller_city ) from sellers;
*/
/*
The REPLACE() function replaces all occurrences of a substring within a string with another substring.
REPLACE(original_string, search_string, replacement_string)
SELECT REPLACE('Hello World', 'World', 'SQL') AS result;
*/
/*
The CONCAT() function is used to combine two or more strings into one.
CONCAT(string1, string2, ..., stringN)
select concat(seller_city,"-",seller_state) as city_state from sellers;

select *,concat(seller_city,"-",seller_state) as city_state from sellers;
-- To retrieve the entire columns along with the concat function
*/
/*
The RIGHT() function in SQL extracts a specified number of characters
 from the end (right side) of a string.
 RIGHT(string, number_of_characters)
string – The text you want to extract characters from.
number_of_characters – How many characters you want from the right end of the string.

 SELECT Name
FROM Students
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID;

*/
/* 
The Date  is used to gather date  related information
SELECT 
    order_purchase_timestamp,
    DAY(order_purchase_timestamp),
    MONTH(order_purchase_timestamp),
    MONTHNAME(order_purchase_timestamp),
    YEAR(order_purchase_timestamp)
FROM
    orders;
datediff() is used to get difference between two dates
select datediff(order_estimated_delivery_date,order_delivered_customer_date) from orders;
*/
/*
-- ceil and floor functions
select payment_value,ceil(payment_value) from payments;-- upper round off value
select payment_value,floor(payment_value) from payments;-- lower round off value
*/
/*
-- null value 
select * from orders where order_delivered_customer_date is null;
*/
/*
The GROUP BY statement is often used with aggregate functions ( COUNT() , MAX() , MIN() , SUM() , AVG() )
 to group the result-set by one or more columns.
 In SQL, you cannot combine aggregates and non-aggregated columns without a GROUP BY.
SELECT column_name, AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column_name
SELECT product_id, SUM(sale_amount) AS total_sales
FROM sales
GROUP BY product_id;
🔸 Groups sales data by product and gives total sales per product.
*/
/*
HAVING is used with GROUP BY to filter grouped results based on aggregate functions (like SUM(), COUNT(), etc.).
🔸 WHERE filters rows before grouping
🔸 HAVING filters groups after grouping
SELECT column_name, AGG_FUNC(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;

SELECT product_id, SUM(sale_amount) AS total_sales
FROM sales
WHERE sale_amount > 100     -- filter raw data first
GROUP BY product_id
HAVING SUM(sale_amount) > 1000;  -- then filter grouped result
 */
 
/*
A JOIN is used in SQL to combine rows from two or more tables based on a related column between them.
SELECT table1.column1, table2.column2
FROM table1
JOIN table2
ON table1.common_column = table2.common_column;
select customers.customer_id,orders.order_status from customers Join orders
on customers.customer_id=orders.customer_id
where order_status="cancelled";

i) INNER JOIN	Returns rows where matches exist in both tables
ii) LEFT JOIN	Returns all rows from the left table, and matching rows from right table
iii)RIGHT JOIN	Returns all rows from the right table, and matching rows from left table
iv)FULL OUTER JOIN	Returns all rows when there's a match in one of the tables
v)CROSS JOIN	Returns Cartesian product – all combinations of rows
*/

/*
A subquery is a query inside another SQL query. It is enclosed in parentheses ( ) and is used to 
return values that are used by the main (outer) query.
select products.product_category,payments.payment_value
from products Join order_items
on products.product_id=order_items.product_id
join payments on payments.order_id=order_items.order_id;
*/

/*
A Common Table Expression (CTE) is a temporary result set (like a virtual table) that you define at the
beginning of a SQL query using the WITH keyword. It makes complex queries easier to read, reuse, and
 break into steps.
 WITH cte_name AS (
    SELECT column1, column2
    FROM some_table
    WHERE condition
)
SELECT * FROM cte_name;

with category_table as (select products.product_category as category,
sum(payments.payment_value) as sales
from products Join order_items
on products.product_id=order_items.product_id
join payments on payments.order_id=order_items.order_id
group by category 
order by sales desc limit 1)

select category from category_table;
*/

/* 
The CASE operator in SQL is like an if-else or switch-case statement in programming.
 It lets you return different values based on conditions in a SELECT, WHERE, ORDER BY, or
 GROUP BY clause.
 
 SELECT 
  column1,
  CASE 
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE default_result
  END AS alias_name
FROM table_name;

select sales, 
Case
when sales>= 21000 then "high"
when sales>=10000 then "low"
else  "least "
end as sales_type
from category_table;

or 
select 
Case
when sales>= 21000 then "high"
when sales>=10000 then "low"
else  "least "
end as sales_type
from category_table;
*/

/*
Window functions perform calculations across a set of rows that are related to the current row, 
without collapsing rows like GROUP BY does.
SELECT column1,
       window_function() OVER (
           PARTITION BY column2
           ORDER BY column3
           ROWS BETWEEN ... -- optional
       ) AS alias
FROM table_name;

PARTITION BY: Like a GROUP BY, but keeps all rows.

ORDER BY: Tells how to order rows within the partition.

OVER(): Tells SQL "apply this window function."

Function	Use
ROW_NUMBER()	Assigns a unique number to each row
RANK()	Ranking with gaps (1,2,2,4...)
 ranking with leaves the space for repeating the no 
 🟠 Notice the jump: Two students got rank 2, so the next rank is 4 (it skips rank 3).
DENSE_RANK()	Ranking without gaps (1,2,2,3...)
🟢 No gaps: Two students tied at rank 2, and the next is rank 3.
SUM()	Running total
AVG()	Moving average

-- You cannot use ORDER BY + LIMIT inside a CTE (a) like that,
--  if you're going to use it again with a RANK() in the next
-- CTE (b). That's because:
-- RANK() requires all rows to assign rank values.
-- But your LIMIT 1 cuts off the data in CTE a to just 1 row.
-- So RANK() never gets a full list to assign rank from.


*/

/*
A view is a virtual table in SQL. It doesn't store data itself but displays data from one or 
more real tables using a predefined SELECT query.

CREATE VIEW view_name AS
SELECT column1, column2
FROM table_name
WHERE condition;
*/

/*
SELECT *
FROM (
    SELECT lat_n, ROW_NUMBER() OVER (ORDER BY lat_n) AS rank
    FROM station
) AS numbered;
You gave the subquery a temporary name: numbered
Without it, SQL wouldn't know what to call that derived table.
*/
/*
COUNT(*) means:

"Count the total number of rows in the table (including NULLs)."
SELECT COUNT(lat_n) FROM station;
➡️ Counts only non-null values in lat_n.
So:
COUNT(*) = total rows
COUNT(column_name) = non-null values in that column
*/
