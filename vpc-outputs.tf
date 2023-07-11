output "vpc-id" {
  value = aws_vpc.myvpc.id
}
output "IGW-ID" {
  value = aws_internet_gateway.myIGW.id
}
output "public-subnet1-id" {
  value = aws_subnet.public1-subnet1.id
}
output "public-subnet2-id" {
  value = aws_subnet.public2-subnet2.id
}