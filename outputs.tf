#outputs.tf

output "s3_bucket_id" 
{
  value = aws_s3_bucket.private_bucket.id
}

output "efs_file_system_id" 
{
  value = aws_efs_file_system.app_efs.id
}

output "ec2_instance_id" 
{
  value = aws_instance.app_server.id
}

output "security_group_id" 
{
  value = aws_security_group.web_sg.id
}

output "subnet_id" 
{
  value = aws_subnet.public_subnet.id
}




