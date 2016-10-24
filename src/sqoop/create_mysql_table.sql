
#### mysql 접속 #####
mysql -u root -p 

#### database 생성 #####
mysql> create database batch DEFAULT CHARACTER SET utf8;

#### 유저 생성 #####
mysql> create user 'batch'@'%' identified by 'batch';
mysql> flush privileges;



#### mysql table 생성 ####
CREATE TABLE daily_station_amount (
  station VARCHAR(30)       ,
  base_dt VARCHAR(8) ,
  amount int(10 ) 
);


