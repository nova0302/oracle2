
-- 테스트용 테이블을 만들고
CREATE TABLE tbl_emp(
eid INTEGER,
esal NUMBER(9));
-- 시퀀스를 만들고
CREATE SEQUENCE seq_eid;

-- 데이터를 입력하고
INSERT INTO tbl_emp VALUES(seq_eid.NEXTVAL, 300000);

-- 프러지져를 만들고
CREATE OR REPLACE PROCEDURE upSal
(veid tbl_emp.eid%TYPE)
IS
    BEGIN
        UPDATE tbl_emp SET esal=500000
        WHERE eid=veid;
    END;
/
-- 생성된 프러시져 확인
DESC USER_SOURCE;
SELECT text FROM USER_SOURCE WHERE name='UPSAL';

-- 일단 확인
SELECT * FROM tbl_emp;

-- 프러시져를 실행하고
EXEC upSal(1);

-- 결과 확인
SELECT * FROM tbl_emp;

    
-- 테스트를 위한 테이블을 만들고
CREATE TABLE tbl_order(
no INTEGER,
ordCode VARCHAR2(10),
ordDate DATE);

-- 문장 trigger을 만들고,
-- 문장 Trigger는 영향을 받는 행이 전혀 업더라도, trigger가 한번은 발생
CREATE OR REPLACE TRIGGER tri_order
BEFORE INSERT ON tbl_order
BEGIN
    IF(TO_CHAR(SYSDATE, 'HH24:MI') NOT BETWEEN '12:05' AND '12:20') THEN
        RAISE_APPLICATION_ERROR(-20100, '허용시간이 아닙니다.');
    END IF;
END;
/

INSERT INTO tbl_order VALUES(4, 'C100', SYSDATE);

-- 행트리거을 만들고
-- 행trigger는 테이블이 trigger이벤트의 여향을 받을때 마다 실행되고,
-- trigger 이벤트의 영향을 받는 행이 없을 경우에는 실행되지 않는다.
CREATE OR REPLACE TRIGGER tri_order2
BEFORE INSERT ON tbl_order
FOR EACH ROW
BEGIN
    IF(:NEW.ordCode) NOT IN ('C100') THEN
        RAISE_APPLICATION_ERROR(-20200, '제품코드가 틀립니다');
    END IF;
END;
/



INSERT INTO tbl_order VALUES(3, 'C300', SYSDATE);

CREATE OR REPLACE TRIGGER tri_order3
BEFORE INSERT ON tbl_order
    FOR EACH ROW
    WHEN (NEW.ordCode = 'C500')
BEGIN
    IF(TO_CHAR(SYSDATE, 'HH24:MI') NOT BETWEEN '19:30' AND '19:35') THEN
        RAISE_APPLICATION_ERROR(-20300, 'C500 제품의 입력허용시간이 아닙니다.!');
    END IF;
END;
/

INSERT INTO tbl_order VALUES(5, 'C500', SYSDATE);
