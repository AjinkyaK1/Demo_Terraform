# subnet.tf

# Defining a Public subnet within the VPC
resource "aws_subnet" "public_subnet" 
{
  vpc_id = aws_vpc.dev_vpc.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
  tags = 
  {
    Name = "PublicSubnet"
  }
}
