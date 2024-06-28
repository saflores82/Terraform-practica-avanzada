# This is where to create variables

#IMPUT VARIABLES

variable "ami" {
  description = "EC2 AMI"
  type    = string
  default = "ami-08a0d1e16fc3f61ea"  # AMI de Amazon Linux 2
}

variable "instance_type" {
  description = "AWS Type of instance"
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  description = "AWS Key Name"
  type    = string
  default = "vockey"
}

variable "ssh_user" {
    description = "User system SSH"
    type        = string
}

variable "ssh_fname" {
    description = "Filename key ssh"
    type        = string
}

variable "script" {
    description = "Filename install service"
    type        = string
}

/*
variable "script" {
  description = "Filename install service"
  type    = string
  default = "install_apache.sh"
  }
*/