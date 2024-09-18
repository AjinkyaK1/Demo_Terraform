# iam.tf

# IAM Role for EC2 instances
resource "aws_iam_role" "ec2_role" 
{
  name = "ec2_role"

  # Allow EC2 to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

# Policy to allow S3 access
resource "aws_iam_role_policy" "s3_access" 
{
  name = "s3_access_policy"
  role = aws_iam_role.ec2_role.id

  # Grant access to the S3 bucket
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "s3:*",  # All S3 actions
      Effect = "Allow",
      Resource = ["${aws_s3_bucket.private_bucket.arn}/*"]
    }]
  })
}

# IAM Instance Profile for EC2
resource "aws_iam_instance_profile" "ec2_profile" 
{
  name = "ec2_profile"
  role = aws_iam_role.ec2_role.name
}
