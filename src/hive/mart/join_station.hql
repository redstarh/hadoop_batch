


select B.* , A.station
from  batch.metro_commerce A JOIN batch.metro_payment_amount B
where B.base_dt ='20160801'
 and  A.commerce_number = B.commerce_number 



