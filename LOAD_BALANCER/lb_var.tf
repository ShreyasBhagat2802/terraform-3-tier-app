variable "private_subnet1_id" {
  description = "ID of the first private subnet"
  type        = string
}

# Variable for Private Subnet 2
variable "private_subnet2_id" {
  description = "ID of the second private subnet"
  type        = string
}

variable "backend_lb_security_group_id" {
  description = "ID of the security group for backend instance"
  type        = string
}

variable "backend_target_group_arn" {
  type = string
}

variable "public_subnet1_id" {
  description = "ID of the first public subnet"
  type        = string
}

# Variable for Private Subnet 2
variable "public_subnet2_id" {
  description = "ID of the second public subnet"
  type        = string
}

variable "frontend_lb_security_group_id" {
  description = "ID of the security group for frontend instance"
  type        = string
}

variable "frontend_target_group_arn" {
  type = string
}
