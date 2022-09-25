# prj-hack-delorean-12345
prj-hack-delorean-12345


### Tratamento dos dados 

fizemos o upload dos dados off-line
arquivos em json realizamos um pré processamento localmente em jupyternotebook para enviar para o bucket s3

info: servidor [Leste dos EUA (Norte da Virgínia)us-east-1]

![image](https://user-images.githubusercontent.com/113641129/192148916-a289b0a3-e7f1-4a00-ae1b-a4964603b795.png)

após o upload para o bucket S3 s3://buckets/squad28-delorean/fase2_prod_csv/ 

schemas : 
          account/
          credit_card/
          customers/
          
          
*Após isso efetuamos o copy dos dados S3<->Redshift materializando para melhor performance (s3_to_redshift.sql).          
          
##Redshift

*Realizamos a criação no redshift DDL.(DDL-redshift.sql)
Configurações:
               Leste dos EUA (Norte da Virgínia)us-east-1
               cluster:squad28
               database:delorean
               user:srv.delorean

schemas:
        account
        credit_card
        customers
        prod ->(view_credit_carbon.sql) 


*Foi realizado toda análise em cima das tabelas gerando assim a view para produção view_credit_carbon.sql 
com o calculo fictício que baseado nas transações bancárias e na lista pré selecionada de gastos que vão contra o ESG
geramos os valores aproximados de carbono que o usuário gastou mensalmente.

