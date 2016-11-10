
#### TCL mysql 생성 ####

mysql -u root 

mysql> create database tcl DEFAULT CHARACTER SET utf8;
mysql> create user 'tcl'@'%'        identified by 'tcl';
mysql> grant all privileges on *.* to 'tcl'@'%';
mysql> FLUSH PRIVILEGES;
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
[root@www ~]# mysql -u root 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 183
Server version: 5.5.50-MariaDB MariaDB Server

Copyright (c) 2000, 2016, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> 
MariaDB [(none)]> 
MariaDB [(none)]> 
MariaDB [(none)]> create database tcl DEFAULT CHARACTER SET utf8;
Query OK, 1 row affected (0.14 sec)

MariaDB [(none)]> create user 'tcl'@'%'        identified by 'tcl';
Query OK, 0 rows affected (0.06 sec)

MariaDB [(none)]> grant all privileges on *.* to 'tcl'@'%';
Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> 
MariaDB [(none)]> 
MariaDB [(none)]> 
MariaDB [(none)]> exit
Bye
[root@www ~]# 
[root@www ~]# 
[root@www ~]# mysql -u root 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
