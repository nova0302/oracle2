ALTER TABLE tb_book DROP CONSTRAINT fk_bCode;
ALTER TABLE tb_member DROP CONSTRAINT fk_mCode;

DROP TABLE tb_book;
CREATE TABLE tb_book(
bCode NUMBER(10) NOT NULL PRIMARY KEY,
name VARCHAR2(20) NOT NULL,
type VARCHAR2(20),
CONSTRAINT con_type CHECK(type IN('소설', '역사', '다큐')));
DESC tb_book;
DROP SEQUENCE seq_seq;
CREATE SEQUENCE seq_seq START WITH 1000000001;
INSERT INTO tb_book VALUES(seq_seq.NEXTVAL, '님꺼정', '소설');
SELECT * FROM tb_book;

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
isDeleted char(1) DEFAULT 'N' NOT NULL ,
CONSTRAINT con_isDeleted CHECK(isDeleted IN('Y', 'N')),
CONSTRAINT fk_bCode FOREIGN KEY(bCode) REFERENCES tb_book(bCode) ON DELETE CASCADE,
CONSTRAINT fk_mCode FOREIGN KEY(mCode) REFERENCES tb_member(mCode) ON DELETE CASCADE
);

DESC tb_rent;

commit;
