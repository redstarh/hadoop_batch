

## 일별 역별 승인금액


select  A.Station , B.base_dt, SUM(B.amount) 
from  batch.metro_commerce A JOIN batch.metro_payment_amount B
where B.base_dt ='20160719'
 and  A.commerce_number = B.commerce_number 
group by A.Station,B.base_dt
