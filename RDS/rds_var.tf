# Variable for Private Subnet 1
variable "private_subnet1_id" {
  description = "ID of the first private subnet for the RDS Subnet Group"
  type        = string
}

# Variable for Private Subnet 2
variable "private_subnet2_id" {
  description = "ID of the second private subnet for the RDS Subnet Group"
  type        = string
}

# Variable for RDS Security Group ID
variable "rds_sg_id" {
  description = "ID of the security group for the RDS instance"
  type        = string
}

variable "rds_name" {
  description = "Master username for the RDS instance"
  type        = string
}

# Variable for RDS DB Username
variable "rds_username" {
  description = "Master username for the RDS instance"
  type        = string
}

# Variable for RDS DB Password
variable "rds_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true 
}
