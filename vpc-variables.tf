variable "vpc-name" {
  type    = string
  default = "VPC"
}
variable "igw" {
  description = "this is for IGW naming"
  type        = string
  default     = "virtual-IGW"
}
variable "public-rt" {
  description = "this is for public-rt naming"
  type        = string
  default     = "virtual-public-rt"

}
variable "private-rt" {
  description = "this is for public-rt naming"
  type        = string
  default     = "virtual-private-rt"

}
variable "public-subnet1" {
  description = "naming for public subnet1"
  type        = string
  default     = "public1-virtual-subnet-1"
}
variable "public-subnet2" {
  description = "naming for public subnet2"
  type        = string
  default     = "public2-virtual-subnet-2"
}
variable "sg-name" {
  type    = string
  default = "sg-virtual-sg"
}