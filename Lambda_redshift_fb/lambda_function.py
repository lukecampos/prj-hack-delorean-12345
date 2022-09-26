import psycopg2
import simplejson

def lambda_handler(event, context):
    print(event)
    # SUBSTITUI POR CPF DE HML
    # cpf = event['cpf']
    cpf = '939.316.884-93'

    conn_string = "dbname='delorean' port='5439' user='srv.delorean' password='Delorean_Squad28' host='squad28.cu1nbmzpxtmp.us-east-1.redshift.amazonaws.com'"  
    con = psycopg2.connect(conn_string)
    cur = con.cursor()
    
    sql = f"select user_firebase, name, value, flag_pgto from prod.dados_perfil where customerid = '{cpf}'"
    cur.execute(sql)
    records = cur.fetchall()

    insertObject = []
    columnNames = [column[0] for column in cur.description]

    for record in records:
        insertObject.append( dict( zip( columnNames , record ) ) )
    
    con.close()
    return {'statusCode': 200, 'body': simplejson.dumps(insertObject)}
