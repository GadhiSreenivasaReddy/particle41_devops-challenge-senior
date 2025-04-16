# VPC
resource "aws_vpc" "vpc_gsr" {
  cidr_block = var.cidr_block
  tags = merge(
    var.default_tags,
    {
      Name = "GSR_vpc"
    }
  )
}

# Fetch available availability zones
data "aws_availability_zones" "available_az" {
  state = "available"
}

# Public subnets
resource "aws_subnet" "subnet_public" {
  count                   = 2
  vpc_id                  = aws_vpc.vpc_gsr.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index)
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available_az.names[count.index]

  tags = merge(
    var.default_tags,
    {
      Name = "subnet-public-${count.index + 1}"
    }
  )
}

# Internet Gateway (IGW)
resource "aws_internet_gateway" "igw_public" {
  vpc_id = aws_vpc.vpc_gsr.id
  tags = merge(
    var.default_tags,
    {
      Name = "igw-public"
    }
  )
}

# Public Route Table
resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.vpc_gsr.id
  tags = merge(
    var.default_tags,
    {
      Name = "route-table-public"
    }
  )
}

# Add public route to public route table
resource "aws_route" "route_public" {
  route_table_id         = aws_route_table.route_table_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_public.id
}

# Associate public subnets with public route table
resource "aws_route_table_association" "association_public" {
  for_each = {
    subnet1 = aws_subnet.subnet_public[0].id
    subnet2 = aws_subnet.subnet_public[1].id
  }
  subnet_id      = each.value
  route_table_id = aws_route_table.route_table_public.id
}

# Private subnets
resource "aws_subnet" "subnet_private" {
  count             = 2
  vpc_id            = aws_vpc.vpc_gsr.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index + 2)
  availability_zone = data.aws_availability_zones.available_az.names[count.index]

  tags = merge(
    var.default_tags,
    {
      Name = "subnet-private-${count.index + 1}"
    }
  )
}

# Private Route Table
resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.vpc_gsr.id

  tags = merge(
    var.default_tags,
    {
      Name = "route-table-private"
    }
  )
}

# Associate private subnets with private route table
resource "aws_route_table_association" "association_private" {
  for_each = {
    subnet1 = aws_subnet.subnet_private[0].id
    subnet2 = aws_subnet.subnet_private[1].id
  }
  subnet_id      = each.value
  route_table_id = aws_route_table.route_table_private.id
}