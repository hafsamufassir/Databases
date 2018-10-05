create DATABASE lab4;

CREATE TABLE customers(
  customer_id INT,
  cust_name VARCHAR(255),
  city VARCHAR(255),
  grade INT,
  salesman_id INT
);

SELECT * FROM customers;

INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3002,'Nick Rimando','New York',100,5001);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3005,'Graham Zusi','California',200,5002);
INSERT INTO customers(customer_id, cust_name, city, salesman_id) VALUES (3001,'Brad Guzan','London',5005);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3004,'Fabian Johns','Paris',300,5006);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3007,'Brad Davis','New York',200,5001);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3009,'Geoff Camero','Berlin',100,5003);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3008,'Julian Green','London',300,5002);

SELECT cust_name FROM customers WHERE grade > 100;

SELECT cust_name FROM customers WHERE city = 'New York' AND grade > 100;

SELECT cust_name FROM customers WHERE city = 'New York' OR grade > 100;

SELECT * FROM customers WHERE city = 'Paris' OR city = 'Rome';

SELECT * FROM customers WHERE cust_name LIKE 'B%';

CREATE TABLE orders(
  order_id SERIAL PRIMARY KEY,
  customer_id INT,
  description text,
  purch_amt INT
);

SELECT * FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = 'New York');

SELECT * FROM customers WHERE customer_id IN (SELECT customer_id FROM orders GROUP BY customer_id HAVING count(order_id) > 10);

SELECT sum(purch_amt) as "Total purchase amount" FROM orders;

SELECT avg(purch_amt) as "Average purchase amount" FROM orders;

SELECT * FROM customers WHERE cust_name IS NOT NULL;

SELECT max(purch_amt) AS "Maximum purchase amount" FROM orders;











