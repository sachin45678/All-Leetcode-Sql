# Write your MySQL query statement below
with first_exam as
(select *,min(exam_date) date
from Scores
group by student_id,subject)

,last_exam as
(select *,max(exam_date) date
from Scores
group by student_id,subject)

,cte1 as
(select f.student_id,f.subject,s.exam_date,s.score score from first_exam f
left join Scores s
on f.student_id=s.student_id and f.subject=s.subject and f.date=s.exam_date)

,cte2 as
(select f.student_id,f.subject,s.exam_date,s.score score from last_exam f
left join Scores s
on f.student_id=s.student_id and f.subject=s.subject and f.date=s.exam_date)

,cte3 as
(select * from cte1
union 
select * from cte2)

,cte4 as
(select * from cte3 
order by student_id,subject,exam_date)

,cte5 as
(select *,lead(score,1,0) over(partition by student_id,subject order by exam_date) as latest_score
from cte4)

select student_id,subject,score first_score,latest_score from cte5
where latest_score>score
order by student_id