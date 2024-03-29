#Problem 183: https://leetcode.com/problems/customers-who-never-order/
Table: Customers
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| Id          | int     |
| Name        | varchar |
+-------------+---------+
Id is the primary key column for this table.
Each row of this table indicates the ID and name of a customer.
 
Table: Orders
+-------------+------+
| Column Name | Type |
+-------------+------+
| Id          | int  |
| CustomerId  | int  |
+-------------+------+
Id is the primary key column for this table.
CustomerId is a foreign key of the ID from the Customers table.
Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
Write an SQL query to report all customers who never order anything.
Return the result table in any order.
--------------------------------------------------------

#SOLUTION: Runtime: 634 ms, faster than 12.45% of MySQL online submissions for Customers Who Never Order.
#Combine the tables using INNER JOIN, then find the orders that are null.
SELECT Name AS Customers
FROM Customers
LEFT JOIN Orders ON Customers.Id=Orders.CustomerId
WHERE Orders.CustomerId IS NULL;

--------------------------------------------------------
A better solution I found using NOT IN from soneone else is this:

SELECT name AS 'Customers'
FROM Customers c
WHERE id NOT IN (SELECT customerId FROM Orders);
