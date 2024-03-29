#Problem 196: https://leetcode.com/problems/delete-duplicate-emails/
Table: Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| Id          | int     |
| Email       | varchar |
+-------------+---------+
Id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest Id.
Return the result table in any order.
The query result format is in the following example.

Example 1:
Input: 
Person table:
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Output: 
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Explanation: john@example.com is repeated two times. We keep the row with the smallest Id = 1.
-----------------------------------

#I had to use Stackoverflow to solve this problem (found a similiar one):
#Runtime: 1596 ms, faster than 57.11% of MySQL online submissions for Delete Duplicate Emails.

DELETE p1 FROM Person p1, Person p2 
WHERE p1.Id > p2.Id AND p1.Email=p2.Email;
