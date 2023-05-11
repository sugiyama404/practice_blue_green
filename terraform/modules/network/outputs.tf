output "app-sg-id" {
  value = aws_security_group.app-sg.id
}

output "elb-sg-id" {
  value = aws_security_group.elb-sg.id
}

output "subnet-group-id-list" {
  value = [aws_subnet.public-1a.id, aws_subnet.public-1c.id]
}

output "security-group-id-list" {
  value = [aws_security_group.app-sg.id, aws_security_group.elb-sg.id]
}

output "main-vpc-id" {
  value = aws_vpc.main.id
}
