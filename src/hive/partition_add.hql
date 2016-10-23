
#### hive CLI 접속 ####
$>hive


#### partition 확인 ####

hive$> use batch;
hive$> show partitions batch.metro_payment_amount;

hive$> ALTER TABLE batch.metro_payment_amount ADD   PARTITION(base_dt='20160801');
hive$> ALTER TABLE batch.metro_payment_amount ADD   PARTITION(base_dt='20160802');
hive$> ALTER TABLE batch.metro_payment_amount ADD   PARTITION(base_dt='20160803');
hive$> ALTER TABLE batch.metro_payment_amount ADD   PARTITION(base_dt='20160804');
hive$> ALTER TABLE batch.metro_payment_amount ADD   PARTITION(base_dt='20160805');

hive$> show partitions batch.metro_payment_amount;
