SQL Problem 184. Department Highest Salary: https://leetcode.com/problems/department-highest-salary/
Table: Employee
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| Id           | int     |
| Name         | varchar |
| Salary       | int     |
| DepartmentId | int     |
+--------------+---------+
Id is the primary key column for this table.
DepartmentId is a foreign key of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 
Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| Id          | int     |
| Name        | varchar |
+-------------+---------+
Id is the primary key column for this table.
Each row of this table indicates the ID of a department and its name.
Write an SQL query to find employees who have the highest salary in each of the departments.
Return the result table in any order.
The query result format is in the following example.

Example 1:
Input: 
Employee table:
+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| Id | Name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+
Output: 
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |
+------------+----------+--------+
Explanation: Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.


---------------------------------------------
'''
This is the first MEDIUM level problem that must use both a JOIN and subquery! 
The first step is getting the output to select the correct criteria from both tables. 
This involves using an INNER JOIN which will combine the two tables on departmentId:
'''

SELECT e.name as "Employee", d.name as "Department", e.salary
FROM employee e INNER JOIN department d
ON e.departmentId=d.id;


'''
The second part will use a subquery that will search for the highest salary in the dept:
AND (departmentId, salary) IN (SELECT departmentId, max(salary) FROM employee GROUP BY departmentId);
'''



#FINAL SOLUTION Runtime: 989 ms, faster than 10.50% of MySQL online submissions for Department Highest Salary:
SELECT e.name as "Employee", d.name as "Department", e.salary
FROM employee e INNER JOIN department d
ON e.departmentId=d.id
AND (departmentId, salary) IN 
(SELECT departmentId, max(salary) 
FROM employee GROUP BY departmentId);


------------------
SPECIAL NOTE:
This SQL solution gets an error because the subquery returns more than one row:

SELECT DISTINCT d.name as "Department", e.name as "Employee", salary
FROM department d JOIN employee e
on e.departmentId=d.id
AND salary= 
(SELECT max(salary) FROM employee 
GROUP BY  d.id );

