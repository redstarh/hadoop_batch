

-- 지하철 결재금액 ORC table 

CREATE EXTERNAL TABLE batch.metro_payment_amount_orc (
dtm                   String  ,
commerce_Number       String  ,
payment_dt            String  ,
amount                int  
)
PARTITIONED BY ( base_dt STRING ) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
STORED AS ORC
LOCATION '/skacademy/payment_amount_orc'
; 

insert overwrite table batch.metro_payment_amount_orc partition (base_dt=20160801)
select 
dtm                   ,
commerce_Number       ,
payment_dt            ,
amount                
from batch.metro_payment_amount
where base_dt='20160801'
;




CREATE  TABLE payment_amount_orc (
dtm                   String  ,
commerce_Number       String  ,
payment_dt            String  ,
amount                int  
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
STORED AS ORC
;



CREATE  TABLE payment_amount (
dtm                   String  ,
commerce_Number       String  ,
payment_dt            String  ,
amount                int  
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
;



insert overwrite table  payment_amount
select 
dtm                   ,
commerce_Number       ,
payment_dt            ,
amount                
from  metro_payment_amount
;

