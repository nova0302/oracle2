CREATE TABLE members(
id VARCHAR(20),
pw VARCHAR(20),
name VARCHAR2(20),
eMail VARCHAR2(20),
rDate date,
address VARCHAR2(50));

DESC members;

ALTER TABLE members
MODIFY address VARCHAR2(50);

ALTER TABLE members
MODIFY id VARCHAR(20);

INSERT INTO members VALUES (
'Peter0715', 
'1234', 
'Peter', 
'Peter0715@gmail.com', 
TO_DATE('20200720'),
'서울 강서구 마곡 서1로 81');
SELECT * FROM members;
SELECT * FROM members WHERE id='Peter0715';
DELETE FROM members m WHERE m.id = 'Peter0715';
commit;

DROP TABLE mvc_board;
CREATE TABLE mvc_board(
bId NUMBER(4) PRIMARY KEY,
bNmae VARCHAR(20),
bTitle VARCHAR(100),
bContent VARCHAR2(300),
bDate DATE DEFAULT SYSDATE,
bHit NUMBER(4) DEFAULT 0,
bGroup NUMBER(4),
bStep NUMBER(4),
bIndent NUMBER(4));

ALTER TABLE mvc_board
RENAME COLUMN bNmae TO bName;

DESC mvc_board;

CREATE SEQUENCE mvc_board_seq;
INSERT INTO mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent)
VALUES(MVC_BOARD_SEQ.nextval, 'abcd', 'is title', 'it content', 0, mvc_board_seq.currval, 0,0);

INSERT INTO mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent)
VALUES(MVC_BOARD_SEQ.nextval, 'bname', 'btitle', 'bcontent', 0, mvc_board_seq.currval, 0,0);commit;

SELECT * FROM mvc_board;

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
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000002, 2000000002, TO_DATE('20200716', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000003, 2000000003, TO_DATE('20200716', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000004, 2000000004, TO_DATE('20200716', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000005, 2000000001, TO_DATE('20200716', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000006, 2000000002, TO_DATE('20200716', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000007, 2000000001, TO_DATE('20200716', 'YYYYMMDD'));

SELECT * FROM tb_member;
SELECT * FROM tb_book;
SELECT * FROM tb_rent;

COMMIT;


