# VPC configuration
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"  # Change this if needed
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}

# Public Subnet A
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"  # Adjust CIDR block as needed
  availability_zone       = "us-east-1a"  # Change availability zone as needed
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-a"
  }
}

# Public Subnet B
resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"  # Adjust CIDR block as needed
  availability_zone       = "us-east-1b"  # Change availability zone as needed
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-b"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw"
  }
}

# Route Table for Public Subnets
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

# Associate Route Table with Public Subnets
resource "aws_route_table_association" "public_subnet_a_assoc" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_b_assoc" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_route_table.id
}

# Security Group
resource "aws_security_group" "allow_http_https" {
  vpc_id = aws_vpc.main.id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }

  tags = {
    Name = "allow-http-https"
  }
}

# VPC (Assuming you already have one defined in your Terraform code)
# If not, you can define a VPC resource here.

# Create the first Application Load Balancer (sandhyalb)
resource "aws_lb" "sandhyalb" {
  name               = "sandhyalb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_all.id]  # Replace with your security group
  subnets            = var.subnets  # Replace with your subnets

  enable_deletion_protection = false
  idle_timeout {
    seconds = 60
  }

  tags = {
    Name = "sandhyalb"
  }
}

# Create the second Application Load Balancer (sandhyalb2)
resource "aws_lb" "sandhyalb2" {
  name               = "sandhyalb2"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_all.id]  # Replace with your security group
  subnets            = var.subnets  # Replace with your subnets

  enable_deletion_protection = false
  idle_timeout {
    seconds = 60
  }

  tags = {
    Name = "sandhyalb2"
  }
}