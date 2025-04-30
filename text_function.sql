-- 1. LENGTH(str) :Returns the length in bytes of the string.When working with storage or encoding
select customer_city , length(customer_city ) from customers;  


-- 2.Trim() removes extra leading and tailing spaces from string
select customer_city,length(trim(customer_city)) from customers;

-- 3. CHAR_LENGTH(str) or CHARACTER_LENGTH(str) Returns the number of characters in the string (not bytes).When counting visible/displayed characters
select char_length(customer_city) from customers;

-- 4. upper () Converts the string to uppercase.
select upper(customer_city) from customers;

-- 5. lower() converts the string to lowercase
select lower(customer_city) from customers;

-- 6. reverse() reverse the order 
select reverse(customer_city) from customers limit 2;

-- 7 . concat() Joins multiple strings together.
select concat(customer_city ," ", customer_city) from customers;

-- 8. SUBSTRING(str, start, length) Extracts a substring from the given string.
select substring(customer_city, 2, 5) from customers;   -- 2 and 5 both are inclusive

-- 9.REPLACE(str, from_str, to_str) Replaces occurrences of a substring.
SELECT customer_city, REPLACE(customer_city, 'franca', 'french') FROM customers;

-- 10.INSTR(str, substr) Returns the position of the first occurrence of substring.
select  customer_city, instr(customer_city,'a') from customers;  