 copy accounts.accounts_balances
from 's3://squad28-delorean/fase2_prod_csv/account/balances.csv'
iam_role 'arn:aws:iam::773943919453:role/Redshift_Default'
IGNOREHEADER as 1
format as csv
delimiter ';';