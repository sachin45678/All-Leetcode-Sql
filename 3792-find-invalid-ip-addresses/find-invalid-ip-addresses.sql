SELECT ip,count(ip) as invalid_count 
FROM logs
WHERE ip not regexp '^(([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\\.){3}([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])$'
group by ip
order by invalid_count desc,ip desc