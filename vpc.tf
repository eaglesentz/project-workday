/*resource "aws_vpc" "proj-vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = merge(var.common_tags, {
    Name = "${var.service_name}-vpc"
  })
}*/
