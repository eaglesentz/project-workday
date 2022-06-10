resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnet_cidr)
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.public_subnet_cidr, count.index)
  availability_zone       = element(var.availability_zone, count.index)
  map_public_ip_on_launch = true

  tags = merge(var.common_tags, {
    Name = element(var.public_subnet_names, count.index),
    Type = "VPC Public Subnet" }
  )
}
resource "aws_subnet" "private_subnet" {
  count                   = length(var.private_subnet_cidr)
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.private_subnet_cidr, count.index)
  availability_zone       = element(var.availability_zone, count.index)
  map_public_ip_on_launch = true

  tags = merge(var.common_tags, {
    Name = element(var.private_subnet_names, count.index),
    Type = "VPC Private Subnet"
  })
}




