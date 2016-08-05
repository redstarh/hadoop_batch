
create database hive;


create user 'hive'@'%'        identified by 'hive';
grant all privileges on *.* to 'hive'@'%';
FLUSH PRIVILEGES;
