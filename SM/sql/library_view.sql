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
SELECT 
tb.name "책이름", 
tb.type "책장르", 
NVL2(tr.bcode,'대여중', '대여가능') "대여상태", 
NVL(TO_CHAR(tr.rent_date, 'yyyy-mm-dd'), ' ') "대여날짜", 
NVL(tm.name, ' ') "대여회원",
nvl2(tr.bcode, '반납', '대여') "반남/대여"
FROM tb_book tb, tb_rent tr, tb_member tm
WHERE tb.bcode = tr.bcode(+) and tr.mcode=tm.mcode(+);
SELECT * FROM vbStatus;

CREATE OR REPLACE VIEW vbStatusB
AS
SELECT * FROM vbStatus ORDER BY "책이름";

CREATE OR REPLACE VIEW vbStatusR
AS
SELECT * FROM vbStatus ORDER BY "대여날짜";

SELECT * FROM vbStatusB;
SELECT * FROM vbStatusR;
--DROP VIEW vbStatus;
--DROP VIEW viewBStateB;


CREATE OR REPLACE VIEW vTemp
AS
SELECT tr.mCode mCode, COUNT(*) nRent 
FROM tb_rent tr
GROUP BY tr.mCode;

SELECT * FROM vTemp;

CREATE OR REPLACE VIEW vmList
AS
SELECT tm.name n, tm.tel t, v.nRent nRent
FROM vTemp v, tb_member tm
WHERE v.mcode = tm.mcode;

SELECT * FROM vmList;



COMMIT;