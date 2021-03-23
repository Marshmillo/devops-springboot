output "public_dns" {
  description = "Get public DNS names assigned to jenkins instance"
  value       = module.jenkinsec2.public_dns
}
output "public_ip" {
  description = "Get public IP names assigned to jenkins instance"
  value       = module.jenkinsec2.public_ip
}

output "endpoint" {
  value = module.ekscluster.endpoint
}

#output "kubeconfig-certificate-authority-data" {
#  value = module.ekscluster.certificate_authority[0].data
#}

output "token" {
  value = element(concat(module.ekscluster[*].token, list("")), 0)
}

