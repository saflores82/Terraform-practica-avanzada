# Terraform-practica-avanzada
En esta práctica avanzada, uso los provisioners "file" y "remote-exec" en Terraform para añadir y ejecutar scripts en una instancia de EC2 en AWS, además de configurará un servidor web como ejemplo práctico.

Debemos recordar modifocar el archivo modules/compute/userdata/ssh.pem con la clave de nuestro laboratorio de AWS para que el proyecto pueda funcionar correctamente:

Detail/show/sshkey/download.pem y cambiarla en el archivo ssh.pem del proyecto

Ejecución de la Configuración de Terraform

Inicializa Terraform:

terraform init

Revisa el plan de ejecución:

terraform plan

Aplica el plan:

Aplica el plan:

terraform apply



