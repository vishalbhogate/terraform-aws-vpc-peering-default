variable "vpc_id" {
  description = "VPC ID of requester"
  default     = "vpc-0376e07d92f833422"
}

variable "peer_owner_id" {
  description = "Account ID of accepter"
  default     = "975816917933"
}

variable "peer_vpc_id" {
  description = "VPC ID of accepter"
  default     = "vpc-03bb2cf9053b1d1cb"
}

variable "accepter_region" {
  description = "Region of acccepter"
  default     = "ap-south-1"
}

variable "serial" {
  default     = 0
  description = "Number of this peering, distinct from others, to avoid conflict with NACL rule number"
}