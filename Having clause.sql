-- having clause
/*HAVING is used with GROUP BY to filter grouped results based on aggregate functions (like SUM(), COUNT(), etc.).
🔸 WHERE filters rows before grouping
🔸 HAVING filters groups after grouping
*/
select payment_type,avg(payment_value) from payments
group by payment_type
having avg(payment_value)> 100;

