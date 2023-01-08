# Source https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

# 3 subnets public in 3 Az
# 3 Subenets private in 3 Az



# Public subnets

resource "aws_subnet" "sub-pub-1" {

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.sub-pub-1a
  availability_zone = "${var.region}a"

  tags = merge(local.commom_tags, {
    Name = "Public-subnet-1a"
    }
  )
}

resource "aws_subnet" "sub-pub-2" {

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.sub-pub-1b
  availability_zone = "${var.region}b"

  tags = merge(local.commom_tags,
    {
      Name = "Public-subnet-1b"
  })

}

resource "aws_subnet" "sub-pub-3" {

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.sub-pub-1c
  availability_zone = "${var.region}c"

  tags = merge(local.commom_tags, {
    Name = "Public-subnet-1c"
    }
  )
}




# Subnet Private 

resource "aws_subnet" "sub-priv-1" {

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.sub-priv-1a
  availability_zone = "${var.region}a"

  tags = merge(local.commom_tags, {

    Name = "Private-subnet-1a"
  })
}


resource "aws_subnet" "sub-priv-2" {

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.sub-priv-1b
  availability_zone = "${var.region}b"

  tags = merge(local.commom_tags, {

    Name = "Private-subnet-1b"
  })
}

resource "aws_subnet" "sub-priv-3" {

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.sub-priv-1c
  availability_zone = "${var.region}c"

  tags = merge(local.commom_tags, {

    Name = "Private-subnet-1c"
  })
}