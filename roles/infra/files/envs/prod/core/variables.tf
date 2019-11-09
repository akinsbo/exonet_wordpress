# VPC Config

variable "vpc_region" {
  description = "AWS region"
  default     = "eu-west-1"
}

variable "vpc_name" {
  description = "VPC for mbshow"
  default     = "mbshow_vpc"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}


# Security Groups
variable "security_group" {
  description = "Security group for private traffic"
  type        = string
  default     = "internal"
}

variable "sg_name" {
  description = "Security group for private traffic"
  type        = string
  default     = "mbshow_sg"
}


# Subnet
variable "subnet1_name" {
  description = "Subnet for webserver"
  type        = string
  default     = "mbshow_main_subnet"
}

variable "subnet1_public_cidr" {
  description = "Security group for public traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "subnet1_private_cidr" {
  description = "Security group for private traffic"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "subnet1_cidr" {
  description = "The cidr of the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet1_az" {
  description = "Availability zones for the subnet"
  type        = string
  default     = "eu-west-1a"
}

# Metadata
variable "env" {
  description = "Environment"
  type        = string
  default     = "prod"
}

variable "author" {
  description = "Name of Author"
  type        = string
  default     = "Olaolu Akinsete"
}

variable "email" {
  description = "Email of Author"
  type        = string
  default     = "akinsbo@gmail.com"
}

variable "default_tags" {
  description = "Metadata"
  type        = map(string)
  default = {
    Name                  = "mbshow_vpc"
    Environment           = "prod"
    Terraform_provisioned = "true"
  }
}
