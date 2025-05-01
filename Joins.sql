-- JOIN
-- A JOIN is used in SQL to combine rows from two or more tables based on a related column between them.

-- inner join
select customers.customer_id,orders.order_status from customers Join orders
on customers.customer_id=orders.customer_id
where order_status="cancelled";

select year(orders.order_purchase_timestamp),payment_value from orders 
Join payments
on orders.order_id=payments.order_id ;

select year(orders.order_purchase_timestamp) as years,sum(payment_value) from orders 
Join payments
on orders.order_id=payments.order_id 
group by years
order by years;

-- Left Join
select customers.customer_id,orders.order_id from customers
Left Join orders
on customers.customer_id=orders.customer_id;

-- Right Join
select customers.customer_id,orders.order_id from customers
Right Join orders
on customers.customer_id=orders.customer_id;

-- Full outer Join
-- select customers.customer_id,orders.order_id from customers
-- Full OUTER Join orders
-- on customers.customer_id=orders.customer_id;

-- cross join
-- select a.id,b.name from table_a a
-- cross join table_b b;
SELECT * FROM Customers
CROSS JOIN Orders;