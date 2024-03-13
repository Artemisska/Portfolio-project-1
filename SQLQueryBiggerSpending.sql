--CREATE TABLE orders (
--id varchar(50),
--customer_id varchar(50)
--)

--CREATE TABLE products (
--id varchar(50),
--price int,
--units_in_stock int
--)

--CREATE TABLE order_items (
--id varchar(50),
--order_id varchar(50),
--product_id varchar(50),
--quantity int
--)

--INSERT INTO orders 
--VALUES
--('9', '115'),
--('11', '116'),
--('12', '117'),
--('13', '118'),
--('14', '119'),
--('15', '120'),
--('16', '121'),
--('17', '122'),
--('18', '123'),
--('19', '124'),
--('20', '125'),
--('21', '126'),
--('22', '127'),
--('23', '128'),
--('24', '129')

--select *
--FROM orders

--INSERT INTO products 
--VALUES
--('5', 13, 154),
--('6', 15, 124),
--('7', 11, 111),
--('8', 18, 79),
--('9', 16, 98),
--('10', 9, 146),
--('29', 14, 85),
--('12', 9, 95)

--select *
--FROM products

--INSERT INTO order_items
--VALUES
--('1', '10',	'8', 5),
--('2', '10',	'10', 2),
--('3', '11',	'5', 3),
--('4', '12',	'12', 2),
--('5', '13',	'11', 4),
--('6', '13',	'8', 3),
--('7', '13',	'5', 2),
--('8', '14',	'10', 1),
--('9', '14',	'8', 3),
--('10', '14', '11', 4),
--('11', '14', '7', 2),
--('12', '15', '12', 5),
--('13', '16', '6', 1),
--('14', '16', '7', 5),
--('15', '17', '11', 1),
--('16', '17', '6', 5),
--('17', '18', '7', 2),
--('18', '18', '9', 3),
--('19', '18', '8', 4),
--('20', '19', '11', 2)

select *
FROM orders
select *
FROM products
select *
FROM order_items


SELECT ord.id AS ord_id, customer_id, order_id, product_id, quantity, prd.id AS prd_id, price, SUM(quantity * price) OVER (PARTITION BY customer_id) AS sum_price_per_product
FROM order_items ord_itm
INNER JOIN orders ord
	ON  ord_itm.order_id = ord.id
INNER JOIN products prd
	ON prd.id = ord_itm.product_id


SELECT DISTINCT TOP 5 customer_id, SUM(quantity * price) OVER (PARTITION BY customer_id) AS total_spending
FROM order_items ord_itm
LEFT OUTER JOIN orders ord
	ON  ord_itm.order_id = ord.id
INNER JOIN products prd
	ON prd.id = ord_itm.product_id
GROUP BY customer_id, price, quantity
ORDER BY total_spending DESC
