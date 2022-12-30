# Resource: aws_route_table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
# Router Table para as Subnets Private 
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.nat.id # Atach do nat_gateway
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "rt-private-terraform" # Nome do recurso 
  }
}


# Router Table para as Subnets Public 
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.igw.id # Atach do gateway_id  
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "rt-public-terraform" # Nome do recurso 
  }
}

# Resource: aws_route_table_association
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "private-sub-1a" {
  subnet_id      = aws_subnet.private-sub-1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-sub-1b" {
  subnet_id      = aws_subnet.private-sub-1b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public-sub-1a" {
  subnet_id      = aws_subnet.public-sub-1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-sub-1b" {
  subnet_id      = aws_subnet.public-sub-1b.id
  route_table_id = aws_route_table.public.id
}
