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


DESC member;
SELECT * FROM member;
DESC tb_book;
DESC tb_member;
DESC tb_rent;


COMMIT;


