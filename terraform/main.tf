provider "aws" {
  region = "us-east-1"  # Change this as needed
}

resource "aws_instance" "web" {
  ami           = "ami-0e86e20dae9224db8"  # Amazon Linux 2 AMI (update if needed)
  instance_type = "t2.micro"
  key_name      = "keynew"  # Replace with your actual key pair name

  security_groups = [aws_security_group.ec2_sg.name]

  user_data = <<-EOF
              #!/bin/bash
                apt update -y
                apt install docker.io -y
                docker run -d -p 8080:8080 ${var.docker_image}
              EOF

  tags = {  
    Name = "Terraform-EC2-Docker"
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}