#s3.tf

# Creating an S3 bucket with private access
resource "aws_s3_bucket" "private_bucket" 
{
  bucket_prefix = "NetSPI-dev-private-bucket-"
  acl = "private"
  tags = 
  {
    Name = "PrivateBucket"
  }
}
