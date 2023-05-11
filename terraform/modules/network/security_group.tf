resource "aws_security_group" "app-sg" {
  name   = "${var.app_name}-app-sg"
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.app_name}-app-sg"
  }
}

resource "aws_security_group" "elb-sg" {
  name   = "${var.app_name}-elb-sg"
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.app_name}-elb-sg"
  }
}
