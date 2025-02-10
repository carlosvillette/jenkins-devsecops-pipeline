resource "aws_security_group" "jenkins" {
  name = "jenkins-sg"
  description = "Allows jenkins access from anywhere on port 8080"
  vpc_id = data.aws_subnet.selected.vpc_id

  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
}