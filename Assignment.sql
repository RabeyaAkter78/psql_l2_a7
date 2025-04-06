CREATE DATABASE bookstore_db;

CREATE Table books(
    id SERIAL PRIMARY KEY,
    title VARCHAR (50) NOT NULL,
    author VARCHAR (50) NOT NULL,
    price DECIMAL(10,2) CHECK (price>=0) NOT NULL,
    stock INT CHECK(stock>=0) NOT NULL,
    published_year INT CHECK ( published_year<=EXTRACT (YEAR FROM CURRENT_DATE))

);

SELECT * from books;


-- customer table:
CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    name VARCHAR (50) ,
    email VARCHAR(100) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);
SELECT * FROM customers;


CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT CHECK(quantity>0) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id)REFERENCES customers(id),
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES books(id)

);

SELECT * FROM orders;

INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
('Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
('You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
('Refactoring', 'Martin Fowler', 50.00, 3, 1999),
('Database Design Principles', 'Jane Smith', 20.00, 0, 2018);

SELECT * FROM books;

INSERT INTO customers (name, email, joined_date) VALUES
('Alice', 'alice@email.com', '2023-01-10'),
('Bob', 'bob@email.com', '2022-05-15'),
('Charlie', 'charlie@email.com', '2023-06-20');
SELECT * FROM customers;
INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES
(1, 2, 1, '2024-03-10'),
(2, 1, 1, '2024-02-20'),
(1, 3, 2, '2024-03-05');
SELECT * FROM orders;
-- Find books that are out of stock:
SELECT title FROM books WHERE stock = 0;

-- Retrieve the most expensive book in the store.
SELECT * FROM books WHERE price = (SELECT MAX(price) FROM books);

-- Find the total number of orders placed by each customer.
SELECT customers.name, COUNT(orders.id) AS total_orders
FROM orders
JOIN customers ON orders.customer_id = customers.id
GROUP BY customers.name;

--  Calculate the total revenue generated from book sales.
SELECT SUM(orders.quantity * books.price) AS total_revenue
FROM orders
JOIN books ON orders.book_id = books.id;

--  List all customers who have placed more than one order.

SELECT customers.name, COUNT(orders.id) AS orders_count
FROM orders
JOIN customers ON orders.customer_id = customers.id
GROUP BY customers.name
HAVING COUNT(orders.id) > 1;


-- Find the average price of books in the store.

SELECT AVG(price) AS average_price
FROM books;

--  Increase the price of all books published before 2000 by 10%.
UPDATE books
SET price = price * 1.10
WHERE published_year < 2000;

select * from books


-- Delete customers who haven't placed any orders.
DELETE FROM customers
WHERE id NOT IN (
    SELECT customer_id
    FROM orders
    WHERE orders.customer_id IS NOT NULL
);

SELECT * FROM customers;