# Resource: aws_eip
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat"
  }
}

# Resource: aws_nat_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-us-east-1a.id # APontando Sunbnet 

  tags = {
    Name = "nat"
  }

  # Para garantir a ordenação adequada, é recomendável adicionar uma dependência explícita
  # no Gateway de Internet para o VPC.
  depends_on = [aws_internet_gateway.igw]
}
