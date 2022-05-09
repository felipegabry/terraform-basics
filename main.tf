

provider "aws" {
    region = "us-east-2"  
}

resource "aws_instance" "gabry" {
    count = 3
    ami = "ami-0aeb7c931a5a61206"
    instance_type = "t2.micro"
    key_name = "gabry_terraform"
    tags = {
        Name = "gabry_${count.index}"
    }  
    vpc_security_group_ids = ["sg-01eff41855d0ce479"]
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}
