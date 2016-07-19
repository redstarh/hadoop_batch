




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
LOCATION '/data/dw/original/metro_commerce'; 

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
ROW FORMAT DELIMITED FIELDS TERMINATED BY "\t"  
LOCATION '/data/dw/original/metro_boading_person'; 

