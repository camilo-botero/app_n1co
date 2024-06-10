
import pymysql
try:
	conexion = pymysql.connect(host='terraform-20240610013746540700000004.chggkkeq884l.us-east-1.rds.amazonaws.com',
                             user='root',
                             password='AppsN1co',
                             db='AppN1co_db')
	try:
		with conexion.cursor() as cursor:
			# En este caso no necesitamos limpiar ningún dato
			cursor.execute("SELECT id, titulo, anio FROM peliculas;")

			# Con fetchall traemos todas las filas
			peliculas = cursor.fetchall()

			# Recorrer e imprimir
			for pelicula in peliculas:
				print(pelicula)
	finally:
		conexion.close()
	
except (pymysql.err.OperationalError, pymysql.err.InternalError) as e:
	print("Ocurrió un error al conectar: ", e)