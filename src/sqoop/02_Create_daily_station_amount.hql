
#### 일별 역별 승인금액 Table생성 ####


CREATE EXTERNAL TABLE batch.daily_station_amount (
station       String  ,
amount        int 
) 
PARTITIONED BY ( base_dt STRING ) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","  
LOCATION '/skacademy/daily_station_amount'
;

##### data 생성 #####


Insert overwrite table batch.daily_station_amount partition (base_dt = 20160801 )
select  A.Station   , 
       SUM(B.amount) amount 
from  batch.metro_commerce A JOIN batch.metro_payment_amount B
where B.base_dt ='20160801'
 and  A.commerce_number = B.commerce_number 
group by A.Station,B.base_dt
;
