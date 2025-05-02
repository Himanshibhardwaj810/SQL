select products.product_category,payments.payment_value
from products Join order_items
on products.product_id=order_items.product_id
join payments on payments.order_id=order_items.order_id;

-- when  sales sum is needed
select products.product_category as category,
sum(payments.payment_value) as sales
from products Join order_items
on products.product_id=order_items.product_id
join payments on payments.order_id=order_items.order_id
group by category 
order by sales desc;

-- when highest sales category is asked then
select category from
(select products.product_category as category,
sum(payments.payment_value) as sales
from products Join order_items
on products.product_id=order_items.product_id
join payments on payments.order_id=order_items.order_id
group by category 
order by sales desc limit 1)as a;

-- common table expression
with category_table as (select products.product_category as category,
sum(payments.payment_value) as sales
from products Join order_items
on products.product_id=order_items.product_id
join payments on payments.order_id=order_items.order_id
group by category 
order by sales desc limit 1)

select category from category_table;