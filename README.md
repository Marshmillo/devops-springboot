# Devops para un proyecto de Springboot

## Explicación de este repositorio

Este repositorio contiene el código para crear la infraestructura base usada en el caso creación de pipeline propuesto para la prueba tecnica (hay ciertos recursos que se crearon manualmente, pero que se pueden automatizar... es una oportunidad de mejora del código).

El flujo que se sigue para crear la ingraestructura es el siguiente:

Se crea una vpc, una subred y un perfil que será el que usará la instancia de jenkins.

### PACKER

Una vez creados esos recursos se configuran en el documento *packer/jenkinsVm_vars.json* y se procede a construir la ami de jenkins con Packer.
Esta ami usará como base una versión de la ami de amazon linux 2 y por medio de __ANSIBLE__ se realizará la intalación de jenkins

~~~
packer build -var-file='packer/jenkinsVm_vars.json' packer/jenkinsVm.json
~~~

La ejecución de este comando creará la ami con jenkins y la id de esta ami se usará como insumo para la sección de terraform.

### Terraform

El id de la ami se debe configurar en el archivo *terraform/terraform.tfvars* junto con una keyPar que previamente se debe crear para este momento.
Una vez configurado el archivo tfvars se procede a ejecutar el siguiente comando:

~~~
terraform apply
~~~

Cuando termina de crearse la infraestructura se procede a hacer la configuración inicial de jenkins y a asignarle los nodos al cluster de eks desde el dashboard de aws.

### Jenkinsfile

Se debe crear un repositorio de imagenes de contenedores que es donde se subira la imagen de docker que se generará en el pipeline.
El pipeline esta definido en el archivo tecnica/Jenkinsfile y en la variable __ecrUri__ se debe colocar la dirección del repositorio de imagenes.
 
### URL DEL PIPELINE

http://ec2-54-82-200-161.compute-1.amazonaws.com:8080/job/Devops%20Springboot/

User: lecto
Password: password
