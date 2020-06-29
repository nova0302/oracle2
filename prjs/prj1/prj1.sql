DROP TABLE member_tbl;
DROP TABLE score_tbl;
DROP TABLE gcno_tbl;
CREATE TABLE member_tbl
       (
        id VARCHAR2(5) not null,     
        name VARCHAR2(20),
        gender VARCHAR2(3),
        constraint member_tbl_pk primary key(id));
        
INSERT INTO member_tbl VALUES ('10301', '권기현', '남'); 
INSERT INTO member_tbl VALUES ('10302', '구지우', '여');
INSERT INTO member_tbl VALUES ('10303', '권태준', '남');
INSERT INTO member_tbl VALUES ('10304', '금기연', '여');
INSERT INTO member_tbl VALUES ('10305', '김영진', '남');
INSERT INTO member_tbl VALUES ('10401', '김주현', '남');
INSERT INTO member_tbl VALUES ('10402', '김태민', '여');
INSERT INTO member_tbl VALUES ('10403', '임수민', '여');
INSERT INTO member_tbl VALUES ('10404', '남상도', '남');
INSERT INTO member_tbl VALUES ('10405', '조은호', '여');

CREATE TABLE score_tbl
       (
        id VARCHAR2(5) not null          
        ,korean number(3)
        ,english number(3)
        ,math number(3)
        ,history number(3)
        ,constraint score_tbl_pk primary key (id));

INSERT INTO score_tbl VALUES('10301', 70, 80 , 75 , 95); 
INSERT INTO score_tbl VALUES('10302', 80, 73 , 80 , 85);
INSERT INTO score_tbl VALUES('10303', 45, 75 , 45 , 75);
INSERT INTO score_tbl VALUES('10304', 65, 73 , 65 , 65);
INSERT INTO score_tbl VALUES('10305', 90, 100, 68 , 95);
INSERT INTO score_tbl VALUES('10401', 95, 75 , 84 , 60);
INSERT INTO score_tbl VALUES('10402', 65, 70 , 50 , 94);
INSERT INTO score_tbl VALUES('10403', 80, 60 , 100, 80);
INSERT INTO score_tbl VALUES('10404', 64, 50 , 40 , 65);
INSERT INTO score_tbl VALUES('10405', 55, 70 , 80 , 75);
       
--select * from member_tbl;
--select * from score_tbl;
commit;
       
