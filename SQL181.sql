#SQL Leetcode Problem 181: https://leetcode.com/problems/employees-earning-more-than-their-managers/
Table: Employee
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| Id          | int     |
| Name        | varchar |
| Salary      | int     |
| ManagerId   | int     |
+-------------+---------+
Id is the primary key column for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
Write an SQL query to find the employees who earn more than their managers.
Return the result table in any order.
The query result format is in the following example.

Example 1:
Input: 
Employee table:
+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.
-------------------------------------
#SOLUTION:
#Runtime: 877 ms, faster than 5.90% of MySQL online submissions for Employees Earning More Than Their Managers.

SELECT a.Name as "Employee" FROM
Employee AS a,
Employee AS b
WHERE a.ManagerId = b.Id
AND a.Salary>b.Salary;

