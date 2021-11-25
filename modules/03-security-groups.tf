resource "aws_security_group" "aws-lb" {
  name = "${var.nginx_app_name}-load-balancer"
  description = "${var.nginx_app_name} ALB Security Group"
  vpc_id = aws_vpc.aws-vpc.id
  ingress {
    protocol = "tcp"
    from_port = var.nginx_app_port
    to_port = var.nginx_app_port
    cidr_blocks = var.app_sources_cidr
  }
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.nginx_app_name}-load-balancer"
  }
}

resource "aws_security_group" "aws-ecs-tasks" {
  name = "${var.nginx_app_name}-ecs-tasks"
  description = "Allow inbound access from the ALB only"
  vpc_id = aws_vpc.aws-vpc.id

  ingress {
    protocol = "tcp"
    from_port = var.nginx_app_port
    to_port = var.nginx_app_port
    security_groups = [aws_security_group.aws-lb.id]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.nginx_app_name}-ecs-tasks"
  }
}
