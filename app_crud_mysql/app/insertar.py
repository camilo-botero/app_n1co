import pymysql
try:
	conexion = pymysql.connect(host='terraform-20240610013746540700000004.chggkkeq884l.us-east-1.rds.amazonaws.com',
                             user='root',
                             password='AppsN1co',
                             db='AppN1co_db')
	try:
		with conexion.cursor() as cursor:
			consulta = "INSERT INTO peliculas(titulo, anio) VALUES (%s, %s);"
			#Podemos llamar muchas veces a .execute con datos distintos
			cursor.execute(consulta, ("Volver al futuro 1", 1985))
			cursor.execute(consulta, ("Ready Player One", 2018))
			cursor.execute(consulta, ("It", 2017))
			cursor.execute(consulta, ("Pulp Fiction", 1994))
		conexion.commit()
	finally:
		conexion.close()
except (pymysql.err.OperationalError, pymysql.err.InternalError) as e:
	print("Ocurrió un error al conectar: ", e)