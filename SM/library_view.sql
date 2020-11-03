ALTER TABLE tb_rent DROP CONSTRAINT fk_bCode;
ALTER TABLE tb_rent DROP CONSTRAINT fk_mCode;

DROP TABLE tb_book;
CREATE TABLE tb_book(
bCode NUMBER(10) NOT NULL PRIMARY KEY,
name VARCHAR2(20) NOT NULL,
type VARCHAR2(20),
CONSTRAINT con_type CHECK(type IN('소설', '역사', '다큐')));
DESC tb_book;

DROP TABLE tb_member;
CREATE TABLE tb_member(
mCode NUMBER(10) NOT NULL PRIMARY KEY,
name VARCHAR2(20) NOT NULL,
tel VARCHAR2(13));
DESC tb_rent;

DROP TABLE tb_rent;
CREATE TABLE tb_rent(
nRent NUMBER(10) NOT NULL PRIMARY KEY,
bCode NUMBER(10),
mCode NUMBER(10),
rent_date date,
CONSTRAINT fk_bCode FOREIGN KEY(bCode) REFERENCES tb_book(bCode) ON DELETE CASCADE,
CONSTRAINT fk_mCode FOREIGN KEY(mCode) REFERENCES tb_member(mCode) ON DELETE CASCADE
);
DESC tb_rent;

DROP SEQUENCE seq_book;
CREATE SEQUENCE seq_book START WITH 1000000001;
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '님꺼정',    '소설');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '짠데렐라',  '소설');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '사국지',    '역사');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '삼국무사',  '역사');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '헬리콥터',  '소설');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '운수나쁜날', '소설');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '너루토',    '역사');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '드라곤불',  '다큐');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '나투브',    '다큐');

DROP SEQUENCE seq_member;
CREATE SEQUENCE seq_member START WITH 2000000001;
INSERT INTO tb_member VALUES(seq_member.NEXTVAL, '오이유',    '010-1111-2222');
INSERT INTO tb_member VALUES(seq_member.NEXTVAL, '박탄소녀단', '010-2222-2222');
INSERT INTO tb_member VALUES(seq_member.NEXTVAL, '무재석',    '010-3333-2222');
INSERT INTO tb_member VALUES(seq_member.NEXTVAL, '약호동',    '010-4444-2222');

DROP SEQUENCE seq_rent;
CREATE SEQUENCE seq_rent START WITH 3000000001;
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000001, 2000000001, TO_DATE('20200716', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000002, 2000000002, TO_DATE('20200616', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000003, 2000000003, TO_DATE('20200511', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000004, 2000000004, TO_DATE('20200526', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000005, 2000000001, TO_DATE('20200221', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000006, 2000000002, TO_DATE('20200312', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000007, 2000000001, TO_DATE('20200111', 'YYYYMMDD'));

SELECT * FROM tb_member;
SELECT * FROM tb_book;
SELECT * FROM tb_rent;

DELETE FROM tb_book WHERE type IS NULL;

CREATE OR REPLACE VIEW vbStatus
AS
SELECT b.name "책이름", b.type "책장르", TO_CHAR(r.rent_date, 'YYYY-MM-DD') "대여날짜", m.name "대여회원"
FROM tb_book b, tb_member m, tb_rent r
WHERE r.bcode = b.bcode and r.mcode=m.mcode;

CREATE OR REPLACE VIEW vbStatusB
AS
SELECT * FROM vbStatus ORDER BY "책이름";

CREATE OR REPLACE VIEW vbStatusR
AS
SELECT * FROM vbStatus ORDER BY "대여날짜";

SELECT * FROM vbStatus;
SELECT * FROM vbStatusB;
SELECT * FROM vbStatusR;
--DROP VIEW vbStatus;
--DROP VIEW viewBStateB;
SELECT name m, tel t FROM tb_member;
SELECT COUNT(name) FROM tb_book WHERE name='님꺼정' and type='역사';
COMMIT;
CREATE OR REPLACE VIEW vTemp
AS
SELECT tr.mCode mCode, COUNT(tr.bCode) nRent 
FROM tb_rent tr
GROUP BY tr.mCode;
SELECT * FROM vTemp;
CREATE OR REPLACE VIEW vmList
AS
SELECT tm.name n, tm.tel t, v.nRent nRent
FROM vTemp v, tb_member tm
WHERE v.mcode = tm.mcode;
SELECT * FROM vmList;

SELECT tb.name, tb.type, tr.rent_date, tm.name
FROM tb_book tb, tb_rent tr, tb_member tm
WHERE tb.bcode = tr.bcode(+) and tm.mcode = tr.mcode;
SELECT * FROM tb_book;
SELECT * FROM tb_rent;
--SELECT tb.name "책이름", tb.type "책장르", 0 "대여상태", tr.rent_date "대여날짜";
CREATE TABLE a0(
no integer);
INSERT INTO a0 values(2);
CREATE TABLE a1(
no integer);
INSERT INTO a1 values(1);
SELECT * FROM a0;
SELECT * FROM a1;
SELECT a0.no, NVL(a1.no, 0) FROM a0, a1
WHERE a0.no = a1.no(+);

CREATE OR REPLACE VIEW vbStatus
AS
SELECT
NVL(TO_CHAR(tr.nrent), ' ') "nRent",
tb.name "책이름", 
tb.type "책장르", 
NVL2(tr.bcode,'대여중', '대여가능') "대여상태", 
NVL(TO_CHAR(tr.rent_date, 'yyyy-mm-dd'), ' ') "대여날짜", 
NVL(tm.name, ' ') "대여회원",
nvl2(tr.bcode, '반납', '대여') "반납/대여"
FROM tb_book tb, tb_rent tr, tb_member tm
WHERE tb.bcode = tr.bcode(+) and tr.mcode=tm.mcode(+);
--ORDER BY 1;
SELECT * FROM vbStatus v WHERE v."책이름"='너루토';

CREATE OR REPLACE VIEW vbStatusB
AS
SELECT * FROM vbStatus ORDER BY "책이름";

CREATE OR REPLACE VIEW vbStatusR
AS
SELECT * FROM vbStatus ORDER BY "대여날짜";

SELECT * FROM vbStatusB;
SELECT * FROM vbStatusR;
--SELECT tb.name "책이름" FROM tb_rent tr, tb_book tb WHERE tr.bcode=tb.bcode;

CREATE OR REPLACE VIEW vTemp
AS
SELECT tr.mCode mCode, COUNT(*) nRent 
FROM tb_rent tr
GROUP BY tr.mCode;

SELECT * FROM vTemp;

CREATE OR REPLACE VIEW vmList
AS
SELECT tm.mcode mc, tm.name n, tm.tel t, v.nRent nRent
FROM vTemp v, tb_member tm
WHERE v.mcode = tm.mcode;

SELECT * FROM vmList;
SELECT * FROM tb_book;
SELECT * FROM tb_member;
DROP TABLE t0;

CREATE TABLE t0(
id INTEGER,
name VARCHAR2(10));

DROP SEQUENCE seq_id;
CREATE SEQUENCE seq_id;

BEGIN
INSERT INTO t0
VALUES(seq_id.NEXTVAL, 'AAA', 30000);
END;
/

BEGIN
UPDATE t0
SET name='BBB'
WHERE id=2;
END;
/

BEGIN
DELETE FROM t0
WHERE id=2;
END;
/

SELECT * FROM t0;
SET SERVEROUTPUT ON;
DECLARE 
    no INTEGER := 3;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(no);
        no := no + 1;
        EXIT WHEN no > 5;
    END LOOP;
END;
/

DECLARE 
    no INTEGER := 3;
BEGIN
    WHILE no < 6 LOOP
        DBMS_OUTPUT.PUT_LINE(no);
        no := no + 1;
    END LOOP;
END;
/

BEGIN
    FOR i in 3..8 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/
SELECT * FROM t0;

DROP TABLE t0;

CREATE TABLE t0(
id INTEGER,
name VARCHAR2(10),
sal NUMBER(10));

DROP SEQUENCE seq_id;
CREATE SEQUENCE seq_id;

CREATE OR REPLACE PROCEDURE upSal
(iid t0.id%TYPE,
isal t0.sal%TYPE
)
IS
    BEGIN 
        UPDATE t0 SET sal=isal
        WHERE t0.id=iid;
    END;
/
EXEC upSal(4, 35000);
SELECT * FROM t0;
DESC USER_SOURCE;
SELECT text FROM USER_SOURCE WHERE name='UPSAL';



