import pymysql
try:
	conexion = pymysql.connect(host='terraform-20240610013746540700000004.chggkkeq884l.us-east-1.rds.amazonaws.com',
                             user='root',
                             password='AppsN1co',
                             db='AppN1co_db')
	try:
		with conexion.cursor() as cursor:
			
			consulta = "DELETE FROM peliculas WHERE anio < %s;"
			anio = 2000
			cursor.execute(consulta, (anio))

		# No olvidemos hacer commit cuando hacemos un cambio a la BD
		conexion.commit()
	finally:
		conexion.close()
	
except (pymysql.err.OperationalError, pymysql.err.InternalError) as e:
	print("Ocurrió un error al conectar: ", e)