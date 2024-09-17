# Creating an EFS file system
resource "aws_efs_file_system" "app_efs" 
{
  creation_token = "dev-app-efs"
  tags = 
  {
    Name = "NetSPI_AppEFS"
  }
}

# Creating an EFS mount target in the public subnet
resource "aws_efs_mount_target" "efs_mount_target" 
{
  file_system_id = aws_efs_file_system.app_efs.id
  subnet_id      = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.web_sg.id]
  tags = 
  {
    Name = "EfsMountTarget"
  }
}
