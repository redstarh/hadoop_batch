

#### 1. download 및 flume  설치  

apt-get install openjdk-7-jdk 

su - hdfs 

wget http://apache.tt.co.kr/flume/1.6.0/apache-flume-1.6.0-bin.tar.gz
tar -zxvf apache-flume-1.6.0-bin.tar.gz
ln -s apache-flume-1.6.0-bin flume




#### 2. test####

(1) case01 

mkdir ~/flume/conf/case01
vi case01.conf
mkdir ~/source
mkdir ~/sink

------------------- case01.conf ------------------
a1.sources = s1
a1.channels = c1
a1.sinks = k1

a1.sources.s1.type = spoolDir
a1.sources.s1.spoolDir = /home/hdfs/source

a1.channels.c1.type = memory
a1.channels.c1.capacity = 1000

a1.sinks.k1.type = file_roll
a1.sinks.k1.sink.directory = /home/hdfs/sink
a1.sinks.k1.sink.rollInterval = 0


a1.sources.s1.channels = c1
a1.sinks.k1.channel = c1
-------------------------------------------------------------        

## source file 만들기 ## 
echo hello > ~/source/hello.txt
echo bye   > ~/source/bye.txt

### run flume ###
~/flume/bin/flume-ng agent -n a1 -c ~/flume/conf/ -f ~/flume/conf/case01/case01.conf  -Dflume.monitoring.type=http   -Dflume.monitoring.port=41414

## 결과 확인 ###
ls -al /home/hdfs/sink 
http://192.168.56.201:41414


(2)case 02

mkdir ~/flume/conf/case02 
cd    ~/flume/conf/case02
vi case02.conf

---------------- case02.conf ---------------

a1.sources = s1
a1.channels = c1
a1.sinks = k1

a1.sources.s1.channels = c1
a1.sinks.k1.channel = c1

a1.sources.s1.type = netcat
a1.sources.s1.bind = localhost
a1.sources.s1.port = 9999

a1.channels.c1.type = memory
a1.channels.c1.capacity = 1000

a1.sinks.k1.type = logger

--------------------------------------------

##### 실행 #######
~/flume/bin/flume-ng agent -c ~/flume/conf/ -f ~/flume/conf/case02/case02.conf -n a1 -Dflume.root.logger=INFO,console

##### telnet #######
telnet localhost 9999
--> log check







