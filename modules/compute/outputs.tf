# This is where to create outputs

#Creating Output

output "public_ip" {
value = aws_instance.web.public_ip
}