-- The GROUP BY statement is often used with aggregate functions ( COUNT() , MAX() , MIN() , SUM() , AVG() )
 -- to group the result-set by one or more columns.
select payment_type,count(payment_type) as count_type from payments
group by payment_type order by count_type desc;

select payment_type,avg(payment_value) from payments
group by payment_type;
select payment_type,round(max(payment_value),2)from payments
group by payment_type;
/*
select payment_value,avg(payment_value) from payments
group by payment_type; ---error 
Jab aap GROUP BY lagate ho, toh:
Jo columns GROUP BY mein hain – wo SELECT mein aasakte hain.
Ya fir, aggregate functions jaise SUM(), AVG(), COUNT() ke andar hona chahiye.

 Lekin agar aap payment_value bhi select karoge, toh SQL confuse ho jaayega: "UPI ke liye 100 dikhau ya 200?"
like 100 k lie 163....
pr ana to upi k lie 163...na 
*/

select product_category,count(product_id) from products
group by product_category;