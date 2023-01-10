resource "aws_security_group" "this" {
  name   = "OPEN-VPN-2"
  vpc_id = aws_vpc.this.id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.40.0.0/16"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "this" {

    for_each = {
        pub = {
            name = "PUB-OPEN-VPN"
            sub = aws_subnet.sub-pub-1.id
            public-ip = true
        }
        priv = {
            name = "PRIV-OPEN-VPN"
            sub = aws_subnet.sub-priv-1.id
            public-ip = false
        }
    }
    ami = var.ami
    instance_type = var.instance_type
    key_name = "openvpn-2"
    tags = {
        Name = "${lookup(each.value, "name", null)}"
        CreatedBy= "Terraform"
    }
    subnet_id   = lookup(each.value, "sub", null)
    associate_public_ip_address = lookup(each.value, "public-ip", null)
    vpc_security_group_ids = [aws_security_group.this.id]

}

#criando uma key pair para a ec2

resource "aws_key_pair" "TF_key" {

  key_name   = "openvpn-2"

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

    filename = "key/openvpn-2.pem"

}



