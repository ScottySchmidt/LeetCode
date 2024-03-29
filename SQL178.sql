SQL Problem178: https://leetcode.com/problems/rank-scores/
Table: Scores
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| Id          | int     |
| Score       | decimal |
+-------------+---------+
Id is the primary key for this table.
Each row of this table contains the score of a game. Score is a floating point value with two decimal places.
 
Write an SQL query to rank the scores. The ranking should be calculated according to the following rules:
The scores should be ranked from the highest to the lowest.
If there is a tie between two scores, both should have the same ranking.
After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
Return the result table ordered by score in descending order.
The query result format is in the following example.

Example 1:

Input: 
Scores table:
+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+
Output: 
+-------+------+
| Score | Rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+
---------------------------------

This solution must use a RANK() function:
RANK() OVER (
   [PARTITION BY expression, ]
   ORDER BY expression (ASC | DESC) );
Source: https://www.geeksforgeeks.org/rank-function-in-sql-server/

After further research, one has to use DENSE_RANK to fully solve the problem:
rank() : It is used to rank a record within a group of rows.
dense_rank() : The DENSE_RANK function acts like the RANK function except that it assigns consecutive ranks.
https://stackoverflow.com/questions/11183572/whats-the-difference-between-rank-and-dense-rank-functions-in-oracle

----------------------------------
#FINAL SOLUTION: Runtime: 257 ms, faster than 64.70% of MySQL online submissions for Rank Scores.
SELECT Score, DENSE_RANK() OVER (ORDER BY score DESC ) as 'Rank' 
FROM Scores;



