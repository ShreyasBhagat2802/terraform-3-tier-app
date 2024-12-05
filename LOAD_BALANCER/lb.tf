resource "aws_lb" "backend" {
  name               = "lb-backend-tf"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.backend_lb_security_group_id]
  subnets            = [var.private_subnet1_id, var.private_subnet2_id]

  tags = {
    Name = "lb-backend-tf"
  }
}

resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_lb.backend.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.backend_target_group_arn
  }
}

resource "aws_lb" "frontend" {
  name               = "lb-frontend-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.frontend_lb_security_group_id]
  subnets            = [var.public_subnet1_id, var.public_subnet2_id]

  tags = {
    Name = "lb-frontend-tf"
  }
}

resource "aws_lb_listener" "frontend" {
  load_balancer_arn = aws_lb.frontend.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.frontend_target_group_arn
  }
}
