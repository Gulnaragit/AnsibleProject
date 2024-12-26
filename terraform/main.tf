resource "aws_key_pair" "keypair" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")

  tags = {
    name = "ansible project"
  }
}

resource "aws_security_group" "ansible" {
  name        = "ansible"
  description = "Allow all traffic"

  ingress {
    description = "allow all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ansible project"
  }
}


# Get AMI ID from aws console(basically pulling some data)
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Create Instance 
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  #availability_zone = "us-east-2a"
  #subnet_id = ""
  key_name               = aws_key_pair.keypair.key_name
  security_groups = [aws_security_group.ansible.name]
  #count                  = 

  tags = {
    Name = "ansible project"
  }
}

# Tags can be used on each resource separately or use variable file local
#   tags = {
#     Name = "HelloWorld"
#     env = "dev"
#     team = "devops"
#     }

# Output publci IP of the intance in the terminal
output "ec2_Ip" {
  value = aws_instance.web.public_ip # It will print publci IP of the instance
}
