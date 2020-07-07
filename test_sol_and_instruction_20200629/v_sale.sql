SET PAGESIZE 50
COL "saleno" for 99999999
COL "pcode" for a8
COL "saledate" for a15
COL "scode" for a8
COL "sname" for a8
COL "name" for a16

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
select vs.scode, sum(vs.sub_total) total
from v_sale vs 
group by vs.scode;

SELECT * FROM vs0;

CREATE OR REPLACE VIEW vs1
AS
select t.scode, ts.sname, t.total
from vs0 t, tbl_shop_01 ts
where t.scode = ts.scode;

SELECT * FROM vs1;

CREATE OR REPLACE VIEW vp0
AS
select vs.pcode, sum(sub_total) total
from v_sale vs, tbl_product_01 tp
where vs.pcode = tp.pcode
group by vs.pcode;

SELECT * FROM vp0;

CREATE OR REPLACE VIEW vp1
AS
select t.pcode, tp.name, t.total
from vp0 t, tbl_product_01 tp
where t.pcode = tp.pcode;

SELECT * FROM vp1;
