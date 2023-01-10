resource "aws_security_group" "this" {
  name   = "OPEN-VPN"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "this" {

    ami = var.ami
    instance_type = var.instance_type
    key_name = "openvpn"
    tags = {
        Name = "OPENVPN-TEST"
        CreatedBy= "Terraform"
    }
    subnet_id   = aws_subnet.sub-pub-1.id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.this.id]

}

#criando uma key pair para a ec2

resource "aws_key_pair" "TF_key" {

  key_name   = "openvpn"

  public_key = tls_private_key.rsa.public_key_openssh

}

#escolhendo o tipo de key

resource "tls_private_key" "rsa" {

  algorithm = "RSA"

  rsa_bits  = 4096

}

#criando um arquivo na maquina para deixar a secret key

resource "local_file" "tf-key" {

    content  = tls_private_key.rsa.private_key_pem

    filename = "key/openvpn.pem"

}



