#This will craete vpc in cloud
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${terraform.workspace}-${local.Vpc-name}-virtual"
  }
  enable_dns_hostnames = true
}
#Internet gateway for vpc
resource "aws_internet_gateway" "myIGW" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = local.IGW-name
  }
}
#Public route table for public-subnets
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = local.Public-rt-name
  }
}
resource "aws_route" "public-subnet-routing" {
  route_table_id         = aws_route_table.public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myIGW.id

}
#creating public subnet1
resource "aws_subnet" "public1-subnet1" {
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = local.Public1-sunet-name
  }

}
#creating public subnet2
resource "aws_subnet" "public2-subnet2" {
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.2.0/24"
   map_public_ip_on_launch = true
  tags = {
    Name = local.Public2-sunet-name
  }

}
resource "aws_route_table_association" "rt-asso-1" {
  subnet_id      = aws_subnet.public1-subnet1.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "rt-asso-2" {
  subnet_id      = aws_subnet.public2-subnet2.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_security_group" "sg-vpc" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = local.SG-Name
  }
  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "allow port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
