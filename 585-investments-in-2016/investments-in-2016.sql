-- Sachin Kumar Sharma
with filter_location as
(select *,concat(lat,lon) as com
from Insurance
group by lat,lon
having count(com)=1)

,filter_tiv_2015 as
(select * 
from Insurance
group by tiv_2015
having count(tiv_2015)>1)




select round(sum(tiv_2016),2) tiv_2016 
from Insurance
where concat(lat,lon) in (select com from filter_location) and tiv_2015 in (select tiv_2015 from filter_tiv_2015)   

