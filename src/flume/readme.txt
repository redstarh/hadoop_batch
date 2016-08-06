

#### 1. download 및 flume  설치  

apt-get install openjdk-7-jdk 

wget http://apache.tt.co.kr/flume/1.6.0/apache-flume-1.6.0-bin.tar.gz
tar -zxvf apache-flume-1.6.0-bin.tar.gz
tar -zxvf apache-flume-1.6.0-bin.tar.gz


#### 2. test

mkdir ~/conf/case01
vi case01.conf
mkdir /root/source
mkdir /root/sink

-------------------------------------
agent.sources = spoolDirSource
agent.channels = memoryChannel
agent.sinks = fileRollSink

agent.sources.spoolDirSource.type = spoolDir
agent.sources.spoolDirSource.spoolDir = /root/source
agent.sources.spoolDirSource.channels = memoryChannel

agent.channels.memoryChannel.type = memory
agent.channels.memoryChannel.capacity = 1000

agent.sinks.fileRollSink.type = file_roll
agent.sinks.fileRollSink.sink.directory = /root/sink
agent.sinks.fileRollSink.channel = memoryChannel
agent.sinks.fileRollSink.sink.rollInterval = 0
-------------------------------------------------------------        

### run flume ###
./flume-ng agent -n case01 --conf /root/flume/conf/case01 -f /root/flume/conf/case01/case01.conf -Dflume.monitoring.type=http   -Dflume.monitoring.port=41414




 

# 폴더 만들기

 

mkdir /tmp/fileroll

mkdir /tmp/spool

# Agent 실행

 

bin/flume-ng agent --conf-file conf/case01.conf.properties --name agent 

# data 생성

 

ls -al /tmp/fileroll

echo hello > /tmp/spool/hello.txt

echo bye > /tmp/spool/bye.txt

# 결과 확인

 

ls -al /tmp/spool

ls -al /tmp/fileroll

 

 

 

# config file 생성 (conf/case02.conf )

agent.sources = execSource

agent.channels = fileChannel

agent.sinks = hdfsSink

 

agent.sources.execSource.type = exec

agent.sources.execSource.command = tail -f /tmp/buffer

agent.sources.execSource.batchSize = 5

agent.sources.execSource.channels = fileChannel

agent.sources.execSource.interceptors = timestampInterceptor

agent.sources.execSource.interceptors.timestampInterceptor.type = timestamp

 

agent.sinks.hdfsSink.type = hdfs

agent.sinks.hdfsSink.hdfs.path = hdfs://bigdata20-02/flume/%Y%m%d-%H%M%S

agent.sinks.hdfsSink.hdfs.fileType = DataStream

agent.sinks.hdfsSink.hdfs.writeFormat = Text

agent.sinks.hdfsSink.channel = fileChannel

 

agent.channels.fileChannel.type = file

agent.channels.fileChannel.checkpointDir = /tmp/flume/checkpoint

agent.channels.fileChannel.dataDirs = /tmp/flume/data

 



