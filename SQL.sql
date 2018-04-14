## https://www.db-fiddle.com/f/4esJmTkXGQVadFnWX4g1A4/0
CREATE TABLE Customers (
  id INT,
  name varchar(255)
);
INSERT INTO Customers (id,name) VALUES (0,'Jenny');
INSERT INTO Customers (id,name) VALUES (1,'Kent');


CREATE TABLE Orders (
  id INT,
  customer_id INT,
  item_name varchar(255)
);
INSERT INTO Orders (id, customer_id,item_name) VALUES (0,0,'pen');
INSERT INTO Orders (id, customer_id,item_name) VALUES (1,1,'pen');
INSERT INTO Orders (id, customer_id,item_name) VALUES (2,1,'book');
INSERT INTO Orders (id, customer_id,item_name) VALUES (3,1,'book2');


## The number of orders made by each customer
SELECT customer_id AS id, name, order_count
FROM (
      SELECT customer_id, COUNT(item_name) AS order_count
      FROM Orders
      GROUP BY customer_id
     ) AS T
INNER JOIN Customers ON T.customer_id=Customers.id;

## The list of all customers who have three or more orders.
SELECT customer_id
FROM (
      SELECT COUNT(item_name) AS order_count, customer_id
      FROM Orders
      GROUP BY customer_id
     ) AS Customers2
WHERE order_count >= 3;

## The list of all customers who have ordered the item named “test item”.
SELECT customer_id AS id, name
FROM(
    SELECT Orders.id,item_name,customer_id,name
    FROM Customers 
    INNER JOIN Orders ON Customers.id=Orders.customer_id
    ) AS Orders2
WHERE item_name='pen';

## The list of all customers who have NOT ordered the item named “test item”.
SELECT DISTINCT customer_id AS id, name
FROM(
    SELECT Orders.id,item_name,customer_id,name
    FROM Customers 
    INNER JOIN Orders ON Customers.id=Orders.customer_id
    ) AS Orders2
WHERE item_name<>'pen';