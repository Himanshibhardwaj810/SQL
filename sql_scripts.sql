use ecommerce;
-- where clause
select customer_id,customer_state from customers;
select * from customers where customer_state="BA";
select * from payments where payment_sequential="2" and payment_value<30;

select * from payments where not(payment_type="voucher" or payment_type="credit_card");

select * from payments where payment_value between 500 and 1000;
-- in operator
select * from customers where customer_state in( "TO","SP","Al");
select * from customers where customer_state not in( "TO","SP","Al");
-- Think of it like != (not equal): you don't write NOT(=).

-- like operator
select * from customers where customer_city like "j%"; -- start with
select customer_city from customers where customer_city like "%i"; -- end with
select customer_city from customers where customer_city like "%arr%"; -- middle
select customer_city from customers where customer_city like "i_";-- exactly one character

select * from payments  order by payment_value; -- by default ascending
select * from payments  order by payment_value,payment_type desc;
SELECT 
    *
FROM
    payments
WHERE
    payment_installments = 1
ORDER BY payment_sequential;

select * from payments limit 5; -- give 5 entries
select * from payments limit 3,2;-- it will skip 3 entries and return 2 rows

-- aggregate function
select sum(payment_value) as Aggregate_sum from payments;
select round(sum(payment_value),2) as Aggregate_sum from payments; -- round sum value by 3 decimal places

select max(payment_value) from payments;
select min(payment_value) from payments;
select avg(payment_value) from payments;

select count(customer_id) from customers;
select count(customer_id) from customers where customer_state ="SP";
select count(distinct customer_city) from customers;

-- Text function
select customer_city,length(customer_city) from customers;
select length(customer_city) as len from customers;
select customer_city,length(trim(customer_city)) from customers;
select trim(customer_city) from customers;

select upper(seller_city),lower(seller_city ) from sellers;

select replace(seller_city,"c","b" ) as new_state  from sellers;
select seller_city,replace(seller_city,"campinas","barara" ) from sellers;

select concat(seller_city,"-",seller_state) as city_state from sellers;