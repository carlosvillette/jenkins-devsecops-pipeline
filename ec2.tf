data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "jenkins" {
  
  ami           = data.aws_ami.amzn-linux-2023-ami.id
  instance_type = "t2.medium"
  subnet_id     = data.aws_subnet.selected.id
  iam_instance_profile = aws_iam_instance_profile.dev-resources-iam-profile.name
  vpc_security_group_ids = [aws_security_group.jenkins.id]

  root_block_device {
    volume_size = 30
  }

  user_data = file("user_data.sh")

  tags = {
    Name = "JenkinsServer"
  }
}