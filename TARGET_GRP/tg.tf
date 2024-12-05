resource "aws_lb_target_group" "backend" {
  name        = "backend-tg-tf"
  protocol    = "HTTP"
  port        = 8000
  vpc_id      = var.vpc_id
  target_type = "instance"
}


resource "aws_lb_target_group" "frontend" {
  name        = "frontend-tg-tf"
  protocol    = "HTTP"
  port        = 80
  vpc_id      = var.vpc_id
  target_type = "instance"
}
