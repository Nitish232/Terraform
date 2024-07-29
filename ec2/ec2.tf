
#resource <resource_type> <resource_name> 
resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "Allow SSH inbound traffic"

    ingress {
        from_port = 22 
        to_port = 22 
        protocol = "tcp" 
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0 #0 means all ports
        to_port = 0 #0 means all ports
        protocol = "-1" #-1 means all protocols
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "Nitish"
    }

}

resource "aws_instance" "backend" {
    ami = "ami-041e2ea9402c46c32"
    instance_type = "t2.micro"
    security_groups =   [aws_security_group.allow_ssh.name]
    tags = {
        Name = "backend"
        CreatedBy = "Nitish"
    }
  
}