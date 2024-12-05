resource "aws_autoscaling_group" "backend" {
  name = "backend_tf_asg"
  launch_template {
    id      = var.backend_launch_template_id
    version = "$Latest"
  }

  min_size                  = 1
  max_size                  = 5
  desired_capacity          = 1
  vpc_zone_identifier       = [var.private_subnet1_id, var.private_subnet2_id]
  target_group_arns         = [var.backend_target_group_arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "BackendAutoScalingInstance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "backend_cpu" {
  name                    = "backend-cpu-scaling-policy"
  autoscaling_group_name  = aws_autoscaling_group.backend.name
  policy_type             = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value     = 50.0
    disable_scale_in = false  # Optional: Defaults to false
  }
}


resource "aws_autoscaling_group" "frontend" {
  launch_template {
    id      = var.frontend_launch_template_id
    version = "$Latest"
  }

  min_size                  = 1
  max_size                  = 5
  desired_capacity          = 1
  vpc_zone_identifier       = [var.public_subnet1_id, var.public_subnet2_id]
  target_group_arns         = [var.frontend_target_group_arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "FrontendAutoScalingInstance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "frontend_cpu" {
  name                    = "frontend-cpu-scaling-policy"
  autoscaling_group_name  = aws_autoscaling_group.frontend.name
  policy_type             = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value     = 50.0
    disable_scale_in = false  # Optional: Defaults to false
  }
}
