resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = format("%s-vpc", var.prefix)
  }
}

resource "aws_subnet" "public-subnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet1_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = format("%s-public-subnet-1", var.prefix)
  }
}

resource "aws_subnet" "private-subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet2_cidr
  availability_zone = "${var.region}b"
  tags = {
    Name = format("%s-private-subnet-2", var.prefix)
  }
}

resource "aws_subnet" "secure-subnet3" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet3_cidr
  availability_zone = "${var.region}c"
  tags = {
    Name = format("%s-secure-subnet-3", var.prefix)
  }
}

resource "aws_subnet" "public-subnet4" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet4_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = format("%s-public-subnet-4", var.prefix)
  }
}

resource "aws_subnet" "private-subnet5" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet5_cidr
  availability_zone = "${var.region}b"
  tags = {
    Name = format("%s-private-subnet-5", var.prefix)
  }
}

resource "aws_subnet" "secure-subnet6" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet6_cidr
  availability_zone = "${var.region}c"
  tags = {
    Name = format("%s-secure-subnet-6", var.prefix)
  }
}

resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "${var.prefix}-internet-gateway"
  }
}

resource "aws_eip" "my_eip" {
  domain = "vpc"
  tags = {
    Name = "${var.prefix}-eip"
  }
}

resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.private-subnet2.id  
  tags = {
    Name = "${var.prefix}-nat-gateway"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id  = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_internet_gateway.id 
  }
  tags = {
    Name = "${var.prefix}-public-route-table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id  = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
  }  
  tags = {
    Name = "${var.prefix}-private-route-table"
  }
}

#associar subnet pública á tabela de rota publica
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id = aws_subnet.private-subnet2.id
  route_table_id = aws_route_table.private_route_table.id
}


