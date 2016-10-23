

CREATE database IF NOT EXISTS batch;

-- 지하철 결재금액

CREATE EXTERNAL TABLE batch.metro_payment_amount (
dtm                   String  ,
commerce_Number       String  ,
payment_dt            String  ,
amount                int  
) 
PARTITIONED BY ( base_dt STRING ) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","  
LOCATION '/skacademy/payment_amount'
; 



ALTER TABLE batch.metro_payment_amount ADD   PARTITION(base_dt='${YMD}');
ex) 
ALTER TABLE batch.metro_payment_amount ADD   PARTITION(base_dt='20160801');

-- 지하철 상가현황

CREATE EXTERNAL TABLE batch.metro_commerce (
sequence              int     ,
commerce_Type         String  ,
commerce_Number       String  ,
Station               String  ,
Area_size             double  ,
commerce_Name         String  ,
commerce_Sector       String  ,
contract_Start_dt     String  ,
contract_end_dt       String  ,
Rent_fee              int  
) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","  
LOCATION '/skacademy/batch/data/dw/original/metro_commerce'; 



-- 지하철 별 승하차 인원

CREATE EXTERNAL TABLE  batch.metro_boading_person ( 
Station               String  ,
Type                  String  ,
HH00                  int     ,
HH01                  int     ,
HH02                  int     ,
HH03                  int     ,
HH04                  int     ,
HH05                  int     ,
HH06                  int     ,
HH07                  int     ,
HH08                  int     ,
HH09                  int     ,
HH10                  int     ,
HH11                  int     ,
HH12                  int     ,
HH13                  int     ,
HH14                  int     ,
HH15                  int     ,
HH16                  int     ,
HH17                  int     ,
HH18                  int     ,
HH19                  int     ,
HH20                  int     ,
HH21                  int     ,
HH22                  int     ,
HH23                  int     ,
Sum                   int 
) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","  
LOCATION '/skacademy/batch/data/dw/original/metro_boading_person'; 
