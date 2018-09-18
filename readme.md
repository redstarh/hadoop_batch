
# Bigdata Architect Lecture


## vm Download path
   - http://169.56.70.54/vm/

## 사전 작업 ( 외부에서 ssh 접속이 VM으로 되지 않을 때 )

     ``` shell
      sudo vi /etc/ssh/sshd_config
      PermitRootLogin yes <- 추가
      sudo service sshd restart
     ```
   -   putty 접속
   - ` ssh root@192.168.56.201 `

###  1. OS  pre setting
   - root 계정으로 실행

   ```
   $> ssh-keygen
   $> cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
      ( ssh-copy-id -i .ssh/id_rsa.pub hadoop01 )
   $> ulimit -n 10000
   ```  

   - repo 최신화
   ```
   $> apt-get update
   ```
   -  ambari-setting for hive MetaStore
    ```
    export LANG=en_US.UTF-8
    ```

   - ntp
   ```
   $> apt-get install ntp
   $> update-rc.d ntp defaults
   ```

## 2. ambari 설치 ###

   - putty 접속
   ```
   ssh root@192.168.56.201
   ```


   - ambari 설치
   ```
   참고 url : https://docs.hortonworks.com/HDPDocuments/Ambari-2.6.2.2/bk_ambari-installation/content/download_the_ambari_repo_ubuntu14.html
   ```

   ```
   $> wget -O wget -O /etc/apt/sources.list.d/ambari.list http://public-repo-1.hortonworks.com/ambari/ubuntu16/2.x/updates/2.6.2.2/ambari.list
   $> apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
   $> apt-get update
   $> apt-cache showpkg ambari-server
   $> apt-cache showpkg ambari-agent
   $> apt-cache showpkg ambari-metrics-assembly
   $> apt-get install ambari-server
   ```

   ```
   $> ambari-server setup
     : JDK 1번 (1.8)
   $> ufw  disable
   ```

   - jdbc connector
   ```
   apt-get install libmysql-java
   ambari-server setup --jdbc-db=mysql --jdbc-driver=/usr/share/java/mysql-connector-java.jar
   ```

   - ambari-server start
   ```
   $>ambari-server start
   ```


## 3. ambari web server ####

   - http://192.168.56.201:8080
```
   key : /root/.ssh/id_rsa 입력 ( ambari 창 )
   hive MetaStore : localhost로 변경
```

## 4.  hadoop02 setting  
   - 계정 : root

```
   $> ssh-keygen
   [ hadoop01 서버에서 root 계정으로 실행 ]
   $> scp /root/.ssh/id_rsa.pub hadoop02:/root/.ssh/authorized_keys
```

## 5. teragen 실습  

   - 계정 : hdfs

  ```
   Teragen
   $> hadoop fs -mkdir -p /user/suser/teragen
   $> cd /usr/hdp/current/hadoop-mapreduce-client
   $> yarn jar ./hadoop-mapreduce-examples.jar teragen 1048576 /user/suser/teragen/1g
   $> hadoop fs -ls /user/suser/teragen/1g
   $> hadoop fs -du -h /user/suser/teragen/1g
   ```

 ```
   Terasort
   $> yarn jar ./hadoop-mapreduce-examples.jar terasort /user/suser/teragen/1g /user/suser/terasort/1g
   $> hadoop fs –ls /user/suser/terasort/1g
```

```
   Teravalidate
   $> yarn jar ./hadoop-mapreduce-examples.jar teravalidate  /user/suser/terasort/1g /user/suser/terasort/validate
```


## 6.spark 실습  
   -  spark example : pi 구하기

```
   cd /usr/hdp/current/spark2-client/
   ./bin/spark-submit --class org.apache.spark.examples.SparkPi \
       --master yarn \
       --deploy-mode client \
       --driver-memory 500m \
       --executor-memory 500m \
       --executor-cores 1 \
       --queue default \
       examples/jars/spark-examples*.jar \
       10
```

   - word count
    - 경로 : /test/input
    - mode : yarn-client

```
   cd /usr/hdp/current/spark2-client/
   hadoop fs -mkdir -p /test/input
   hadoop fs -put /usr/hdp/current/spark2-client/LICENSE /test/input/.

  ./bin/spark-shell --master yarn --deploy-mode client

   val textFile = sc.textFile("hdfs:///test/input")
   val counts = textFile.flatMap(line => line.split(" ")).map(word => (word, 1)).reduceByKey(_ + _)
   counts.saveAsTextFile("hdfs:///test/spark_wordcount")
```
