@echo off

set local_path=./local.sql

(
  echo alter user system identified by 1234;
  echo commit;
  echo CREATE USER scott IDENTIFIED BY tiger;
  echo GRANT CONNECT, RESOURCE TO scott;
  echo exit;
  
) > %local_path%

sqlplus / as sysdba @%local_path%

del "%local_path%"

sqlplus system/1234
