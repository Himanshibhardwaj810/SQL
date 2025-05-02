CREATE VIEW high_value_payments AS
SELECT order_id, payment_value
FROM payments
WHERE payment_value > 1000;