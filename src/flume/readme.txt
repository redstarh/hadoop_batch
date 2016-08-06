

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





