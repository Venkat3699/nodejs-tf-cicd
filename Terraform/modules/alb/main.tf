resource "aws_lb" "app_alb" {
  name               = "${var.name}-app-alb"
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = [var.alb_sg]
  subnets            = var.public_subnets
}

resource "aws_lb_target_group" "app_tg" {
  name     = "${var.name}-app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/health"
    interval            = 15
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}