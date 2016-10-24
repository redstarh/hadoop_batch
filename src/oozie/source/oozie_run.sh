

#### make oozie src dir ####
user : hdfs


mkdir ~/oozie 
cd ~/oozie 
hadoop fs -mkdir /skakademy/oozie_src

#### source download ####

cd ~/oozie
wget https://raw.githubusercontent.com/hellotherecsy/SkAcademy/master/src/oozie/source/job.properties
wget https://raw.githubusercontent.com/hellotherecsy/SkAcademy/master/src/oozie/source/workflow.xml
wget https://raw.githubusercontent.com/hellotherecsy/SkAcademy/master/src/oozie/source/script.hql
https://raw.githubusercontent.com/hellotherecsy/SkAcademy/master/src/oozie/hive-site.xml

#### hadoop put for source ####

hadoop fs -put *.* /skacademy/oozie_src/.

export OOZIE_HOME=/usr/hdp/current/oozie-client


##### workflow 실행 ####
oozie job -oozie http://hadoop01:11000/oozie -config job.properties -run

### job kill 할 경우 ####
oozie job -oozie http://hadoop01:11000/oozie -kill ${workflow_ID}
oozie job -oozie http://hadoop01:11000/oozie -kill 0000003-161024140321177-oozie-oozi-W


