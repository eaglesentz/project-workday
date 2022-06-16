resource "aws_alb" "workday_balancer" {
  load_balancer_type = "application"
  name               = "${var.service_name}-Load-Balancer"
  internal           = false
  security_groups    = [aws_security_group.alb_security_group.id]

  tags = merge(var.common_tags, {
    Name = "${var.service_name}-Load-Balancer"
  }
  )
  subnets = aws_subnet.public_subnet.*.id
}

resource "aws_alb_target_group" "workday-albtg" {
  name     = "alb-front-http"
  vpc_id   = var.vpc_id
  port     = "80"
  protocol = "HTTP"
  health_check {
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    interval            = 5
    timeout             = 4
    matcher             = "200"
  }
  tags = merge(var.common_tags, {
    Name = "${var.service_name}-alb_front"
  })
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.workday_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.workday-albtg.arn
  }
  tags = merge(var.common_tags, {
    Name = "${var.service_name}-target-group"
  } )
}