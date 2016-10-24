
#### sqoop export #####

sqoop export \
--connect jdbc:mysql://hadoop01/batch \
--username hive \
--password hive \
--table  daily_station_amount  \
--hcatalog-database batch \
--hcatalog-table   daily_station_amount \
--hcatalog-partition-keys base_dt \
--hcatalog-partition-values 20160801
