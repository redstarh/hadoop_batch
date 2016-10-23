
#### mysql 접속 #####
mysql -u root -p 


#### database 생성 #####
create database batch DEFAULT CHARACTER SET utf8;

#### mysql table 생성 ####
CREATE TABLE daily_station_amount (
  station VARCHAR(30)       ,
  base_dt VARCHAR(8) ,
  amount int(10 ) 
);


