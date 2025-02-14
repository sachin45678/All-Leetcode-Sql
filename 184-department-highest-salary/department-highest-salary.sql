with cte1 as
(select e.*,max(salary) over(partition by e.departmentId) max_salary
from Employee e),

cte2 as
(select * from cte1
group by departmentId
)

select d.name Department, e.name Employee, e.salary Salary from Employee e
 join cte2 
on cte2.departmentId=e.departmentId and cte2.max_salary=e.salary
join Department d
on cte2.departmentId=d.id and e.departmentId=d.id