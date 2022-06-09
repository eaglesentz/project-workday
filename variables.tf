variable "region" {
  type        = string
  description = "AWS region name"
}
variable "vpc_cidr" {
  type = string
}
variable "service_name" {
  description = "The name of the network"
  default     = "prj-dev"
}
variable "public_subnet_cidr" {
  type = list(string)
}
variable "public_subnet_names" {
  type = list(string)
}
variable "private_subnet_cidr" {
  type = list(string)
}
variable "private_subnet_names" {
  type = list(string)
}
variable "instance_type" {
  default = "t2.micro"
}
variable "ami" {
  default = "ami-00f6a0c18edb19300"
}
variable "availability_zone" {
  type = list(string)
}
variable "AWS_ACCESS_KEY" {
  type = string
}
variable "AWS_SECRET_KEY" {
  type = string
}
variable "domain_name" {
  type = list(string)
}

variable "common_tags" {
  type = map(string)
  default = {
    project     = "Workday"
    environment = "Dev"
    team        = "Platform Engineering"
  }
}

variable "dockerhub_credentials" {
  type = string
}

variable "codestar_connector_credentials" {
  type = string

}
