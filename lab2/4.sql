INSERT INTO customer(full_name, timestamp, delivery_address) values('Karamergenova Zhibek','2021-09-23 14:00:08','Dostyk 24');
INSERT INTO orders values(1, 1, 1000, true);
INSERT INTO products values(1, 'flower','flower is abcd', 600.00);
INSERT INTO order_items values(1, 1, 2);

UPDATE customer SET delivery_address='Nauryz 4' WHERE id=1;
UPDATE orders SET total_sum=1000 where customer_id=1;
UPDATE products SET price=500.00 where name='flower';
UPDATE order_items SET quantity=2 where order_code=1;

DELETE FROM order_items WHERE order_code=1;
DELETE FROM products WHERE name='flower';
DELETE FROM orders WHERE code=1;
DELETE FROM customer WHERE id=1;