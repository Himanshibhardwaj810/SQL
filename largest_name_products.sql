-- to retrieve ethe name of largest product
select product_category from products where char_length(product_category)=
(select max(char_length(product_category)) from products)
order by product_category
limit 1;
