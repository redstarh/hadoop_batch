
Insert overwrite table batch.daily_station_amount partition (base_dt = '${day}' )
select  A.Station   , 
       SUM(B.amount) amount 
from  batch.metro_commerce A JOIN batch.metro_payment_amount B
where B.base_dt = '${day}'
 and  A.commerce_number = B.commerce_number 
group by A.Station,B.base_dt
;

