#CREA UNA INSTANCIA EC2 
resource "aws_instance" "web" {
  ami           = var.ami  # AMI de Amazon Linux 2
  instance_type = var.instance_type
  key_name      = var.key_name  # Cambia esto al nombre de tu par de claves SSH
 
  tags = {
    Name = "webserver"
  }
 
  # Define el Security Group para permitir tráfico HTTP y SSH
  vpc_security_group_ids = [aws_security_group.web_sg.id]
 
  provisioner "file" {
    source      = "./modules/compute/userdata/${var.script}"
    destination = "/tmp/${var.script}"
  }
 
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/${var.script}",
      "sudo /tmp/${var.script}"
    ]
  }
 
  connection {
    type        = "ssh"
    user        = var.ssh_user
    private_key = file("./module/compute/userdata/${var.ssh_fname}")  # Ruta a tu clave privada
    host        = self.public_ip
  }
}

resource "null_resource" "configure-consul-ips1" {
  connection {
    type        = "ssh"
    user        = var.ssh_user
    private_key = file("./modules/compute/userdata/${var.ssh_fname}")  # Ruta a tu clave privada
    host        = aws_instance.web.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo echo 'prueba' >> /home/ec2-user/hola.txt"
      
    ]
  }
}

#CREA LOS SECURITY GROUPS
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP and SSH traffic"
 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
