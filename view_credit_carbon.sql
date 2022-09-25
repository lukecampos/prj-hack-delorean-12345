create or replace view prod.dados_perfil as
select 
	customerid
	,civilname
	--,sum(sum_amount) as sum_amount
	,sum(1+ (0.003*(sum_amount-1)))::numeric(12,2) as credit_carbon
	,year
	,month
from(
SELECT id.customerid
       ,id.civilname
       ,sum(transac.amount) as sum_amount
       ,transac.transactiondate
       ,substring(transac.transactiondate,1,4) as year
       ,substring(transac.transactiondate,6,2) as month
FROM "delorean"."customers"."personal_identification" ID
INNER JOIN "delorean"."credit_cards"."credit_cards_bills_transactions" transac
      ON id.customerid = transac.customerid
WHERE transac.TRANSACTIONNAME IN ('Viagem'
  , 'Gás'
  , 'Luz'
  , 'Agua'
  , 'Combustível'
  , 'Aplicativo de Transporte'
  , 'Taxi')
 group by id.customerid
 , id.civilname
 ,transac.transactiondate) 
 --where customerid =f1 and year=f2 and month=f3
 group by customerid,civilname,year,month;