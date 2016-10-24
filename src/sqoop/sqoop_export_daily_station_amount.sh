


#### sqoop export #####

sqoop-export

--username hive \
--password hive \

sqoop export \
--connect jdbc:mysql://hadoop01/hive \
--username batch \
--password batch \
--table batch.daily_station_amount  \
--hcatalog-table  batch.daily_station_amount \
--hcatalog-partition-keys base_dt \
--hcatalog-partition-values 20160801
