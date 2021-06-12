provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami                    = "ami-048f6ed62451373d9" // amazon linux 
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web.id]
  key_name = "${aws_key_pair.key.key_name}"
  

  # user_data = <<-EOF
  #             #!/bin/bash
  #             yum -y update
  #             yum -y install httpd
  #             echo "<h2>hello terraform</h2>" > /var/www/html/index.html
  #             service httpd start
  #             chkconfig httpd on
  #             EOF

  
  tags = {
    Name = "webserver-terraform"
  }
}

resource "aws_key_pair" "key" {
  key_name   = "keyfile"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDleOmiY+rVvZBPkaYEhcZBRQO3ejx/Tst8s2taB4YGTgxqjTGHvNy05emI3hrNJW+ChHTWWPbJ4V1rP3rmFbnTeWjmGLdomLDsR6hrzPHtIQ0MNF11swoFfBRce03oqTWLYb04gN5h+j80R4Pn0X8KJdbJQUqvRU4QDx0NVgWdfdsQh6mJdbNTV4LyrFjN3S6OArs1OUFc9nK85bUPH9PCbTKNGdTlv2YQkCbug46lYKf/Bn7rfBMU66sUZdKhMHB2wqE30dqwnSEv9aPbKM1DIhvMuEX7zvLWq5HBDEtRDvdlPo13jA6ezfFWwNzxVIAWZJZDyfB5ECqr3XvVnwcz root@Jenkins"
}

resource "aws_security_group" "web" {
  name = "webserver-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}