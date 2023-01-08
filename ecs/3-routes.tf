# source https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
#IGW

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

  tags = merge(local.commom_tags, {
    Name = "igw-terraform-ecs"
  })
}


# source https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

#Route Table Public
resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = merge(local.commom_tags, {
    Name = "Public-Route-Table-Terraform"
  })
}

# Route Table Private
resource "aws_route_table" "rt-priv" {
  vpc_id = aws_vpc.this.id

  tags = merge(local.commom_tags, {
    Name = "Private-Route-Table-Terraform"
  })
}


# Subnet Association Public

resource "aws_route_table_association" "pub-1" {
  subnet_id      = aws_subnet.sub-pub-1.id
  route_table_id = aws_route_table.rt-public.id
}

resource "aws_route_table_association" "pub-2" {
  subnet_id      = aws_subnet.sub-pub-2.id
  route_table_id = aws_route_table.rt-public.id
}

resource "aws_route_table_association" "pub-3" {
  subnet_id      = aws_subnet.sub-pub-3.id
  route_table_id = aws_route_table.rt-public.id
}

# Subnet Association private

resource "aws_route_table_association" "priv-1" {
  subnet_id      = aws_subnet.sub-priv-1.id
  route_table_id = aws_route_table.rt-priv.id
}

resource "aws_route_table_association" "priv-2" {
  subnet_id      = aws_subnet.sub-priv-2.id
  route_table_id = aws_route_table.rt-priv.id
}

resource "aws_route_table_association" "priv-3" {
  subnet_id      = aws_subnet.sub-priv-3.id
  route_table_id = aws_route_table.rt-priv.id
}






