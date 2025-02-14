# Write your MySQL query statement below

with cte as
(select *,dense_rank() over(order by salary desc) rnk from Employee)

select max(salary) SecondHighestSalary from cte
where rnk=2
