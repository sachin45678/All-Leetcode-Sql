# Write your MySQL query statement below
with cte1 as
(select accepter_id ida,requester_id idr from RequestAccepted)
,cte2 as
(select requester_id ida,accepter_id idr from RequestAccepted)
,cte3 as
(select * from cte1
union
select * from cte2)

select ida id,count(ida) num from cte3
group by ida
order by num desc
limit 1