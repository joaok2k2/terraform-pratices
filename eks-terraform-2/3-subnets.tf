# Resource: aws_subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

# Criação de 4 Subnets 2 Public e 2 Private

# Primeira Subnet Private
resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = aws_vpc.main.id # apontando a Vpc 
  cidr_block        = "10.0.0.0/19"
  availability_zone = "us-east-2a"

  tags = {                                                   # informações para controler 
    "Name"                            = "private-us-east-1a" # Nome da Subnet
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned" # quem vai usar subnet 
  }
}

# Segunda Subnet Private
resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = aws_vpc.main.id # apontando a Vpc 
  cidr_block        = "10.0.32.0/19"
  availability_zone = "us-east-2b"

  tags = {
    "Name"                            = "private-us-east-1b" # Nome da Subnet
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned" # quem vai usar subnet 
  }
}

# Primeira Subnet Public
resource "aws_subnet" "public-us-east-1a" {
  vpc_id            = aws_vpc.main.id # apontando a Vpc 
  cidr_block        = "10.0.64.0/19"
  availability_zone = "us-east-2a"

  tags = {
    "Name"                       = "public-us-east-1a" # Nome da Subnet
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned" # quem vai usar subnet
  }
}

# Segunda Subnet Public
resource "aws_subnet" "public-us-east-1b" {
  vpc_id            = aws_vpc.main.id # apontando a Vpc 
  cidr_block        = "10.0.96.0/19"
  availability_zone = "us-east-2b"

  tags = {
    "Name"                       = "public-us-east-1b" # Nome da Subnet
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned" # quem vai usar subnet
  }
}
