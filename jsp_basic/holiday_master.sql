CREATE TABLE holiday_master
       (
        theday VARCHAR2(10),     
        thedesc VARCHAR2(10));  
INSERT INTO holiday_master VALUES
        ('SMITH',  'CLERK');
select * from holiday_master;
desc holiday_master;
commit;
