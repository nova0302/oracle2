SET PAGESIZE 50
COL saleno FOR 99999999
COL pcode FOR a8
COL saledate FOR a15
COL scode FOR a8
COL sname FOR a8
COL name FOR a16

CREATE OR REPLACE VIEW v_sale
AS
SELECT
tsl.saleno,
tsl.pcode ,
TO_CHAR(tsl.saledate , 'YYYY-MM-DD') saledate,
tsl.scode ,
tp.name ,
tsl.amount ,
(tsl.amount * tp.cost) sub_total
FROM tbl_salelist_01 tsl, tbl_product_01 tp
WHERE tsl.pcode = tp.pcode;

SELECT * FROM v_sale;

CREATE OR REPLACE VIEW vs0
AS
SELECT vs.scode, sum(vs.sub_total) total
FROM v_sale vs 
GROUP BY vs.scode;

SELECT * FROM vs0;

CREATE OR REPLACE VIEW vs1
AS
SELECT t.scode, ts.sname, t.total
FROM vs0 t, tbl_shop_01 ts
WHERE t.scode = ts.scode;

SELECT * FROM vs1;

CREATE OR REPLACE VIEW vp0
AS
SELECT vs.pcode, sum(sub_total) total
FROM v_sale vs, tbl_product_01 tp
WHERE vs.pcode = tp.pcode
GROUP BY vs.pcode;

SELECT * FROM vp0;

CREATE OR REPLACE VIEW vp1
AS
SELECT t.pcode, tp.name, t.total
FROM vp0 t, tbl_product_01 tp
WHERE t.pcode = tp.pcode;

SELECT * FROM vp1;
