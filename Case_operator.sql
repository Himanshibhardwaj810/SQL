-- The CASE operator in SQL is like an if-else or switch-case statement in programming.
 -- It lets you return different values based on conditions in a SELECT, WHERE, ORDER BY, or
 -- GROUP BY clause.
 

with category_table as (select products.product_category as category,
sum(payments.payment_value) as sales
from products Join order_items
on products.product_id=order_items.product_id
join payments on payments.order_id=order_items.order_id
group by category 
order by sales desc )

select  *,
Case
when sales>= 21000 then "high"
when sales>=10000 then "low"
else  "least "
end as sales_type
from category_table
;