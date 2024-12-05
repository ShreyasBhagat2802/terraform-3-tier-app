terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#provider "aws" {
#  region = var.region
#}

module "vpc" {
  source                = "./VPC"
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidr_1  = var.public_subnet_cidr_1
  public_subnet_cidr_2  = var.public_subnet_cidr_2
  private_subnet_cidr_1 = var.private_subnet_cidr_1
  private_subnet_cidr_2 = var.private_subnet_cidr_2
  availability_zone_1   = var.availability_zone_1
  availability_zone_2   = var.availability_zone_2
}

module "security_groups" {
  source = "./SECURITY_GRP"
  vpc_id = module.vpc.vpc_id
}

module "rds_instance" {
  source             = "./RDS"
  private_subnet1_id = module.vpc.private_subnet1
  private_subnet2_id = module.vpc.private_subnet2
  rds_sg_id          = module.security_groups.rds_sg_id
  rds_name           = var.rds_db_name
  rds_username       = var.rds_username
  rds_password       = var.rds_password
}

module "target_group" {
  source = "./TARGET_GRP"
  vpc_id = module.vpc.vpc_id
}

module "lb_security_grp" {
  source = "./LB_SECURITY_GRP"
  vpc_id = module.vpc.vpc_id
}

module "load_balancer" {
  source                        = "./LOAD_BALANCER"
  private_subnet1_id            = module.vpc.private_subnet1
  private_subnet2_id            = module.vpc.private_subnet2
  backend_lb_security_group_id  = module.lb_security_grp.backend_lb_security_group_id
  backend_target_group_arn      = module.target_group.backend_target_group_arn
  public_subnet1_id             = module.vpc.public_subnet1
  public_subnet2_id             = module.vpc.public_subnet2
  frontend_lb_security_group_id = module.lb_security_grp.frontend_lb_security_group_id
  frontend_target_group_arn     = module.target_group.frontend_target_group_arn
}

module "launch_template" {
  source         = "./LAUNCH_TEMPLATE"
  access_key     = var.access_key
  backend_ami    = var.Backend_AMI
  backend_sg_id  = module.security_groups.backend_sg_id
  forntend_ami   = var.Frontend_AMI
  frontend_sg_id = module.security_groups.frontend_sg_id
}

module "auto_scaling_grp" {
  source                      = "./AUTO_SCALING_GRP"
  backend_launch_template_id  = module.launch_template.backend_launch_template_id
  private_subnet1_id          = module.vpc.private_subnet1
  private_subnet2_id          = module.vpc.private_subnet2
  backend_target_group_arn    = module.target_group.backend_target_group_arn
  frontend_launch_template_id = module.launch_template.frontend_launch_template_id
  public_subnet1_id           = module.vpc.public_subnet1
  public_subnet2_id           = module.vpc.public_subnet2
  frontend_target_group_arn   = module.target_group.frontend_target_group_arn
}
