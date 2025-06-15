use e_commerce_store;
select * from reviews;

-- question 
-- List all customers who have placed at least one order along with their total number of orders and total amount spent.
SELECT 
    customers.name,
    COUNT(orders.customer_id),
    SUM(orders.total_amount),
    orders.customer_id
FROM
    customers
        JOIN
    orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id , customers.name;

-- Find the top 3 products with the highest number of units sold.
select * from order_items;
select * from orders;
select * from products;
select products.name, sum(order_items.quantity) as unit_sold from products join order_items on products.product_id = order_items.product_id group by order_items.product_id order by unit_sold desc limit 3;

-- Get the average rating for each product and display only those products with average rating > 4.0.
select * from reviews;
select * from products;
-- avg rating for all the product
SELECT 
    products.name AS product_name, AVG(reviews.rating)
FROM
    products
        JOIN
    reviews ON products.product_id = reviews.product_id
GROUP BY reviews.product_id;
-- avg rating having > 4.0
SELECT 
    products.name AS product_name, AVG(reviews.rating)
FROM
    products
        JOIN
    reviews ON products.product_id = reviews.product_id
GROUP BY reviews.product_id
HAVING AVG(reviews.rating) > 4.0;

-- Show each customer’s most expensive order and the date it was placed
select  * from customers;
select  * from orders;
SELECT 
    customers.name AS name_of_customer,
    MAX(orders.order_date) AS date_of_order,
    SUM(orders.total_amount)
FROM
    customers
        JOIN
    orders ON customers.customer_id = orders.customer_id
GROUP BY orders.customer_id;

-- List products that have never been ordered.
select * from products;
select * from order_items;
SELECT 
    *
FROM
    products
        JOIN
    order_items ON products.product_id = order_items.order_id
WHERE
    order_items.order_id IS NULL;


-- Generate a report of each customer’s favorite product category based on the
-- number of times they ordered products in that category.
select * from products;
select * from orders;
select * from customers;
select * from order_items;
-- answ
SELECT 
    customers.name,
    orders.product_id AS product_orders_by_customer,
    products.name,
    products.price
FROM
    customers
        JOIN
    orders ON customers.customer_id = orders.customer_id
        JOIN
    products ON orders.product_id = products.product_id
ORDER BY 2 DESC;









