-- Window functions perform calculations across a set of rows that are related to the current row, 
-- without collapsing rows like GROUP BY does.


select purchase_date,total_payments,
sum(total_payments) over(order by purchase_date) from 
(select date(orders.order_purchase_timestamp) as Purchase_date,
sum(payments.payment_value) as Total_payments from orders
join payments
on orders.order_id=payments.order_id
group by purchase_date) as a;

with a as(select products.product_category as category,
sum(payments.payment_value) as sales
from products Join order_items
on products.product_id=order_items.product_id
join payments on payments.order_id=order_items.order_id
group by category ),

b as (select category,sales,rank() over(order by sales)rk
from a)
select category,sales from b where rk<=3;

-- You cannot use ORDER BY + LIMIT inside a CTE (a) like that,
--  if you're going to use it again with a RANK() in the next
-- CTE (b). That's because:
-- RANK() requires all rows to assign rank values.
-- But your LIMIT 1 cuts off the data in CTE a to just 1 row.
-- So RANK() never gets a full list to assign rank from.

