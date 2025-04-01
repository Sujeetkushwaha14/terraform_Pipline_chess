provider "aws" {
  region = "us-east-1"  # AWS region
}

resource "aws_instance" "hello_world" {
  ami           = "ami-0e35ddab05955cf57"  # Example Amazon Linux AMI
  instance_type = "t2.micro"

  # User data script to create a simple Hello World page
  user_data = <<-EOF
              #!/bin/bash
              echo "<html><body><h1>Hello World from Terraform!</h1></body></html>" > /var/www/html/index.html
              service httpd start
              chkconfig httpd on
              EOF

  tags = {
    Name = "HelloWorldServer"
  }
}



output "instance_public_ip" {
  value = aws_instance.hello_world.public_ip
}

