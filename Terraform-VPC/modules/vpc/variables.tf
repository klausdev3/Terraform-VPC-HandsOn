variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR Range"
}

variable "subnet_cidr" {
    type        = list(string)    
    description = "Subnet CIDRS"
}

variable "subnet_names" {
    type        = list(string)
    default     = ["PublicSubnet1", "PublicSubnet2"]
    description = "Subnet names"
}