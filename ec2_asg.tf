resource "aws_launch_template" "web_lt" {
  name_prefix     = "web-template"
  image_id        = "ami-0c02fb55956c7d316" # Amazon Linux 2 (region: us-east-1)
  instance_type   = "t2.micro"
  key_name        = "shell"  # Replace with your key or remove if using SSM

  # ✅ Embed user_data inline
  user_data = base64encode(<<EOF
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
echo "<h1>Hello from $(hostname)</h1>" > /var/www/html/index.html
sudo systemctl enable httpd
sudo systemctl start httpd
EOF
  )

  # ✅ Correctly reference security group by ID
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
}

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 1
  max_size             = 1
  min_size             = 1

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  # ✅ Ensure subnet belongs to the custom VPC
  vpc_zone_identifier  = [aws_subnet.public_1.id]
  target_group_arns    = [aws_lb_target_group.web_tg.arn]
  health_check_type    = "EC2"
  force_delete         = true # helpful when destroying ASG
}
