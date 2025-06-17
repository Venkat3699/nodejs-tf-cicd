
resource "aws_launch_template" "app_lt" {
  name_prefix   = "${var.name}-app_lt"
  image_id      = var.ami_id
  instance_type = var.instance_type

  user_data = base64encode(<<EOF
#!/bin/bash
echo "Hello from $(hostname)" > index.html
nohup python3 -m http.server 80 &
EOF
  )
}

resource "aws_autoscaling_group" "app_asg" {
  name                      = "${var.name}-app_asg"
  min_size                  = var.asg_min_size
  max_size                  = var.asg_max_size
  health_check_type         = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier       = var.public_subnets

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "AppInstance"
    propagate_at_launch = true
  }
}