@echo off
set conf_path=%temp%\conf.sql

echo set linesize 999> %conf_path%
echo set pagesize 999>> %conf_path%
echo set sqlprompt "_USER> ">> %conf_path%

start cmd /k sqlplus scott/tiger @%conf_path%

timeout /t 3
del %conf_path%
exit /b 0
