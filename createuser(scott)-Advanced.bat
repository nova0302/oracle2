@echo off

set download_path=%temp%\default.sql
set target_url=https://raw.githubusercontent.com/nova0302/oracle2/master/test_data_eng.sql
echo Download Default SQL File From Url(%target_url%)!
powershell -Command "(New-Object Net.WebClient).DownloadFile('%target_url%', '%download_path%')"
IF %ERRORLEVEL% neq 0 goto :ERROR
echo exit;>> %download_path%
echo Download Done!

set edit_path=%temp%\local.sql
set conf_path=%temp%\conf.sql
set count=5

echo Settings:
echo   Edit SQL Path: %edit_path%
echo   Conf SQL Path: %conf_path%
echo.
echo Executing After 5 Seconds
goto :ONE_SEC

:ONE_SEC
echo %count%
ping -n 2 127.0.0.1 > nul 2>&1
set /a count-=1
IF %count% GTR 0 goto :ONE_SEC

echo SET serveroutput ON> %edit_path%

echo DECLARE>> %edit_path%
echo   EXISTS_NUM NUMBER(1);>> %edit_path%
echo BEGIN>> %edit_path%
echo   EXECUTE IMMEDIATE 'ALTER USER system IDENTIFIED BY 1234';>> %edit_path%
echo   commit;>> %edit_path%
echo   SELECT CASE WHEN EXISTS (SELECT 1 FROM all_users WHERE username = 'SCOTT') THEN 1 ELSE 0 END INTO EXISTS_NUM FROM DUAL;>> %edit_path%
echo   IF EXISTS_NUM = 1 THEN>> %edit_path%
echo     EXECUTE IMMEDIATE 'ALTER USER scott IDENTIFIED BY tiger';>> %edit_path%
echo   ELSE>> %edit_path%
echo     EXECUTE IMMEDIATE 'CREATE USER scott IDENTIFIED BY tiger';>> %edit_path%
echo     EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO scott';>> %edit_path%
echo   END IF;>> %edit_path%
echo   commit;>> %edit_path%
echo   DBMS_OUTPUT.PUT_LINE('Success!');>> %edit_path%
echo END;>> %edit_path%
echo />> %edit_path%

echo exit;>> %edit_path%

sqlplus -s / as sysdba @%edit_path%

echo Invoke Default SQL Data to Scott
start cmd /k "sqlplus -s scott/tiger @%download_path% && exit /b 0"
echo Done!

echo set linesize 999> %conf_path%
echo set pagesize 999>> %conf_path%

start cmd /k sqlplus scott/tiger @%conf_path%

echo EDIT Success!!
echo REMOVE Temp Files After 5 Seconds!

timeout /t 5

del %edit_path%
del %conf_path%
del %download_path%

echo Done..!
pause
exit /b 0

:ERROR
echo Error Occurred
pause
exit /b 1
