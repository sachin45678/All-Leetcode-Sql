# Write your MySQL query statement below
with cte1 as
(select users_id from users 
where banned="No")

,cte2 as
(select * from Trips t
where t.client_id in (select c.users_id from cte1 c) and t.request_at>="2013-10-01"
and t.request_at<="2013-10-03")

(select t.request_at as Day,round(sum(
    case 
    when t.status="cancelled_by_driver" then 1
    when t.status="cancelled_by_client" then 1
    else 0
    end

) /count(t.request_at),2) as 'Cancellation Rate' from cte2 t
where t.driver_id in (select c.users_id from cte1 c) 
group by t.request_at)
