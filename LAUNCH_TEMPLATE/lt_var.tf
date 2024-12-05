variable "access_key" {
  description = "Kay Pair for ssh"
  type        = string
}

variable "backend_ami" {
  description = "Backend AMI"
  type = string
}

variable "forntend_ami" {
  description = "Frontend AMI"
  type = string
}

variable "backend_sg_id" {
  type = string
}

variable "frontend_sg_id" {
  type = string
}
