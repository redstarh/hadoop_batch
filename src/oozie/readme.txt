

#### oozie 설치 ## 


# Hortonworks 배포판 기준 ( HDP )

## 1.ambari-server ## 
ambari-server setup --jdbc-db=mysql --jdbc-driver=/usr/share/java/mysql-connector-java-5.1.17.jar

## 2. oozie user 및 접속 권한
mysql -u root 

mysql> create database oozie;
mysql> create user 'oozie'@'%'        identified by 'oozie';
mysql> grant all privileges on *.* to 'oozie'@'%';
mysql> FLUSH PRIVILEGES;

## 3. oozie mysq jdbc setting 
cd /usr/hdp/current/oozie-client
bin/oozie-setup.sh prepare-war

이후 ambari web ui를 이용하여 재기동.

아래 Web으로 확인
http:/$<oozie-server-ip>:11000/oozie/





