create or replace view trnsact_10k as (
select * from trnsact limit 10000);

create or replace view deptinfo_10k as (
select * from deptinfo limit 10000);

create or replace view sksinfo_10k as (
select * from sksinfo limit 10000);

create or replace view skuinfo_10k as (
select * from skuinfo limit 10000);

create or replace view strinfo_10k as (
select * from strinfo limit 10000);

create or replace view partial_full_joined_table as (
select strinfo_10k.storeid, strinfo_10k.city, strinfo_10k.state, strinfo_10k.zipcode,
	
sksinfo_10k.sku, sksinfo_10k.cost, sksinfo_10k.retail,
	
trnsact_10k.store, trnsact_10k.register,
trnsact_10k.trannum, trnsact_10k.seq, trnsact_10k.saledate, trnsact_10k.stype,
trnsact_10k.quantity, trnsact_10k.orgprice, trnsact_10k.amt, trnsact_10k.amt2,
trnsact_10k.interid, trnsact_10k.mic, trnsact_10k.zero,
	
skuinfo_10k.dept, skuinfo_10k.classid, skuinfo_10k.upc, skuinfo_10k.style,
skuinfo_10k.color, skuinfo_10k.size, skuinfo_10k.packsize, skuinfo_10k.vendor,
skuinfo_10k.brand, skuinfo_10k.var
	

from trnsact_10k full outer join strinfo_10k on 
strinfo_10k.storeid = trnsact_10k.store
full outer join sksinfo_10k on strinfo_10k.storeid = sksinfo_10k.storeid
full outer join skuinfo_10k on skuinfo_10k.sku = sksinfo_10k.sku
--full outer join deptinfo_10k on deptinfo_10k.dept_name = skuinfo_10k.dept
	);

-- Both cannot be joined as of now
select * from deptinfo_10k;
select * from skuinfo_10k;
