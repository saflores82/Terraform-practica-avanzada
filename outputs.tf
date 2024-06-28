# This is where to create outputs

#Creating Output

output "public_ip" {
  value = module.compute.public_ip
}

output "subnet_names" {
  value = module.vpc.subnet_names
}

output "subnet_ids" {
  value = module.vpc.subnet_ids
}