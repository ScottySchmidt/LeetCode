These problems are 'easy' that require little to no explanation. 

#https://leetcode.com/problems/game-play-analysis-i/
#SQL 511
SELECT player_id, min(event_date) AS "first_login" 
FROM Activity
GROUP BY 1;


#https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/
#SQL 586
SELECT customer_number 
FROM orders
GROUP BY customer_number
order by count(customer_number)
DESC LIMIT 1;


#https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/
#SQL 1050
SELECT a.actor_id, a.director_id
FROM ActorDirector a
GROUP BY a.actor_id, a.director_id
HAVING count(*)>2;


#https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
#SQL 1581
SELECT customer_id, count(visit_id) as 'count_no_trans'
FROM visits 
WHERE visit_id NOT IN (select distinct transactions.visit_id from transactions)
GROUP BY customer_id ORDER BY count_no_trans;


# https://leetcode.com/problems/sales-analysis-iii/
SELECT product.product_id, product.product_name FROM product
INNER JOIN sales 
ON product.product_id=sales.product_id
GROUP BY sales.product_id
HAVING min(sales.sale_date) >= "2019-01-01"
AND max(sales.sale_date) <="2019-03-31";


# https://leetcode.com/problems/patients-with-a-condition/
SELECT DISTINCT (author_id) as id 
FROM views
WHERE author_id=viewer_id
order by id asc;

#https://leetcode.com/problems/patients-with-a-condition/
SELECT patient_id, patient_name, conditions
FROM patients
WHERE conditions LIKE '% DIAB1%'
OR conditions LIKE 'DIAB1%';

#https://leetcode.com/problems/recyclable-and-low-fat-products/submissions/
SELECT product_id
FROM products
WHERE low_fats = 'Y'
AND recyclable = 'Y';

# https://leetcode.com/problems/find-total-time-spent-by-each-employee/submissions/
SELECT event_day as day, emp_id, sum(out_time-in_time) as total_time
FROM employees
GROUP BY emp_id, event_day;

# https://leetcode.com/problems/the-latest-login-in-2020/description/
SELECT user_id, max(time_stamp) as last_stamp
FROM logins
WHERE year(time_stamp)= 2020
GROUP BY user_id;

# https://leetcode.com/problems/daily-leads-and-partners/description/
SELECT date_id, make_name, count(DISTINCT(lead_id)) as unique_leads, count(DISTINCT(partner_id)) as unique_partners
FROM dailysales
GROUP BY date_id, make_name;

#https://leetcode.com/problems/find-followers-count/description/
SELECT user_id, count(distinct(follower_id)) as followers_count
FROM followers
GROUP BY user_id;
