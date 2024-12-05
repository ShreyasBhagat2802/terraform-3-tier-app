resource "aws_launch_template" "backend" {
  name        = "BS_TF"
  image_id    = var.backend_ami
  instance_type = "t2.micro"
  key_name    = var.access_key

  network_interfaces {
    associate_public_ip_address = false
    device_index                = 0
    security_groups             = [var.backend_sg_id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "TFBackend"
    }
  }
}

resource "aws_launch_template" "frontend" {
  name          = "FS_TF"
  image_id      = var.forntend_ami
  instance_type = "t2.micro"
  key_name      = var.access_key

  network_interfaces {
    associate_public_ip_address = true
    device_index                = 0
    security_groups             = [var.frontend_sg_id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "TFFrontend"
    }
  }
}
