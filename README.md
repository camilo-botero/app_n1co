 <h2 align="center">APP N1CO</h2>
 <p align="center">
    Este es el despliegue de la infraestructura propuesta por N1CO en el que se publicaran los siguientes entregables.

  * Código de terraform con las mejoras prácticas para el despliegue de la arquitectura requerida.
  * Código del servicio, dockerizado y con pipeline de despliegue con Github Action.
  * Manifiestos o Script para despliegue de servicio en Kubernetes. NOTA: no es necesario agregar otras configuraciones como Ingress Controller, Cert Manager, etc. Solo es requerido el despliegue de servicio.
  * Scripts de configuraciones base de datos relacional si aplica.
  * Un Readme con: los requerimientos, procesos necesarios para desplegar la infraestructura requerida, diagrama básico de los servicios desplegados.
</p> 
<br />
<div align="center">
  <h3 align="center">Arquitectura</h3>

 <p align="left">
  Se desplegara la infraestructura en la region US-WEST-1 de AWS, en esta region se hara uso de 2 zonas de disponibilidad, en cada zona de disponibilidad se despliega 1 zona publica y una zona privada, en esta infraestructura se despliega un cluster de AWS Fargate y un cluster de Bases de Datos RDS que recibe las conexiones desde el cluster Kubernetes.
</p> 
  <a href="images/Diagrama n1co.png">
    <img src="images/Diagrama n1co.png" alt="Arquitectura" width="800" height="800">
  </a>
<br />
<br />
<h3 align="center">Código de terraform</h3>
 <p align="left">
  El codigo terraform esta contenido en la carpeta `Cluster_eks`, se desplego en un solo proyecto con la finalidad de simplificar su despliegue.
</p> 
 <p align="left">
  Para desplegar el proyecto completo, solo es necesario modificar los valores del archivo locals.tf , estoy consciente que no es comun agregar el access_key y secret_key en un archivo.tf, pero 
  para este caso, me parece mas facil de evaluar y de desplegar.
</p> 

<h3 align="center">Código del servicio</h3>
 <p align="left">
  Se crea una imagen a partir de un dockerfile y una app basica con los procedimientos basicos de escritura, lectura y borrado de datos en una base de datos mysql, estos archivos estan contenidos en la carpeta  `App_crud_mysql`, se creo una imagen docker y se publico en mi dockerhub (https://hub.docker.com/u/camilobotero) para su despliegue en kubernetes.
</p> 
 <p align="left">
  Para construir la imagen se usaron los comandos:
</p> 

</div>

```
  docker build -t camilobotero/app_n1co:latest .
  docker push camilobotero/app_n1co
```

<h3 align="center"> Manifiestos o Script para despliegue de servicio en Kubernetes.</h3>
 <p align="left">
  El manifiesto para el deployment esta contenido en la carpeta "deploy-kubernetes", para desplegarse debe actualizarse el cubeconfig del cluster desplegado con terraform y despues ejecutar el comando
</p> 
</div>

```
  kubect apply -f deploy-APP.yaml
```

<h3 align="center"> Scripts de configuraciones base de datos relacional.</h3>
 <p align="left">
  La base de datos relacional se desplego en AWS RDS mediante Terraform, los archivos .tf estan incluidos en el la carpeta "Cluster_eks" para hacer uso facilmente de los parametros definidos en "locals.tf"
</p> 
</div>











