import pymysql
try:
	conexion = pymysql.connect(host='terraform-20240610013746540700000004.chggkkeq884l.us-east-1.rds.amazonaws.com',
                             user='root',
                             password='AppsN1co',
                             db='AppN1co_db')
	print("Conexión correcta")
except (pymysql.err.OperationalError, pymysql.err.InternalError) as e:
	print("Ocurrió un error al conectar: ", e)