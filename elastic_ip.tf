# elastic_ip.tf

# Provisioning Elastic IP
resource "aws_eip" "instance_eip" 
{
  tags = 
  {
    Project = "NetSPI_EIP"
  }
}

# Associating the Elastic IP with the EC2 instance
resource "aws_eip_association" "eip_assoc" 
{
  instance_id   = aws_instance.app_server.id
  allocation_id  = aws_eip.instance_eip.id
}
