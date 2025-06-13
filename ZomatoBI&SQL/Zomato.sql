create database zomato;

USE zomato;
select * from cleaned;

# 1.	Retrieve all orders that have been successfully delivered.
SELECT * FROM cleaned 
WHERE Order_Status LIKE 'Delivered';
SELECT * FROM cleaned 
WHERE Order_Status LIKE 'D%';

# 2.	Find the average delivery duration for each cuisine type.

select avg(Delivery_Duration_Minutes),Cuisine_Type
from cleaned 
group by Cuisine_Type
order by avg(Delivery_Duration_Minutes) DESC;

#3.	Get the total number of orders cancelled by customers.

select count(Order_Status)
from cleaned
where Order_status = "Cancelled";

# 4.	List the top 3 customers who have placed the highest number of orders.

SELECT Customer_id,COUNT(Order_id) AS total_orders
FROM cleaned
GROUP BY Customer_id
ORDER BY total_orders DESC
LIMIT 3;
 
 # 5.	Get the number of orders cancelled due to restaurant-related issues (assuming 'Cancellation_Reason' can indicate this).
SELECT COUNT(Cancellation_Reason) AS reason_count,Cancellation_Reason
FROM cleaned
WHERE Cancellation_Reason != 'Not Cancelled'
GROUP BY Cancellation_Reason;

#6.	Find the maximum and minimum restaurant ratings for restaurants in Mumbai.

select min(Restaurant_Rating),max(Restaurant_Rating)
from cleaned
where city = "Mumbai";

# 7.	Retrieve all orders where payment was made using a Card.
select Order_ID 
from cleaned
where Payment_Method = "Card";

#8.	Find the average customer rating for each city.
SELECT City, AVG(Customer_Rating)
FROM cleaned
GROUP BY City
ORDER BY AVG(Customer_Rating) DESC;

#9.	Calculate the total revenue generated from successfully delivered orders.
select sum(Order_Value)
from cleaned
where Order_Status = "Delivered";
 
#10.	List all incomplete orders along with their respective reasons.
select Order_ID , Cancellation_Reason
from cleaned
where Cancellation_Reason != "Not Cancelled";


