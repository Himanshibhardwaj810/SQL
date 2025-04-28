use ecommerce;
select customer_id,customer_state from customers;
select * from customers where customer_state="BA";
select * from payments where payment_sequential="2" and payment_value<30;
select * from payments where not(payment_type="voucher" or payment_type="credit_card");
select * from payments where payment_value between 500 and 1000;
--
