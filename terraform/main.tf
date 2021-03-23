provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}


module "jenkinsec2" {
  source                      = "./modules/jenkinsec2"
  name                        = "jenkins-server"
  ami                         = var.jenkins-ami-id
  instance_type               = var.jenkins-instance_type
  key_name                    = var.jenkins-key_name
  subnet_id                   = tolist(data.aws_subnet_ids.all.ids)[0]
  associate_public_ip_address = true
  vpc_id                      = data.aws_vpc.default.id
}

module "ekscluster" {
  source = "./modules/ekscluster"
  name = "ekscluster"
  subnet_ids =  slice(tolist(data.aws_subnet_ids.all.ids),0,2)

}