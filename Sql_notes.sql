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
*/
