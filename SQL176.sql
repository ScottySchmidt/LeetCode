#SQL Problem176: https://leetcode.com/problems/second-highest-salary/ 
Table: Employee
+-------------+------+
| Column Name | Type |
+-------------+------+
| Id          | int  |
| Salary      | int  |
+-------------+------+
Id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.
Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.
The query result format is in the following example.

Example 1:
Input: 
Employee table:
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| Null                |
+---------------------+
--------------------------------

#SOLUTION: Runtime: 399 ms, faster than 5.41% of MySQL online submissions for Second Highest Salary.
SELECT IFNULL(
(SELECT DISTINCT salary 
FROM Employee 
ORDER BY salary DESC 
LIMIT 1 OFFSET 1), NULL) AS SecondHighestSalary;


---------------------
#This easily selects the first two highest values:
SELECT salary AS "SecondHighestSalary"
FROM Employee
ORDER BY salary DESC LIMIT 2;

#The challenge becomes how to select only the second highest salary now. 
#Using LIMIT 1 selects ONE the first row and then OFFESET 1 "deletes" the first row (selecting the second row only).
