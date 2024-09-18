# ec2.tf

# Launch an EC2 instance
resource "aws_instance" "app_server" 
{
  ami = "<ami-id>" 
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.web_sg.name]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  tags = 
  {
    Name = "AppServer"
  }

  # Remote-exec Provisioner to set up the instance
  provisioner "remote-exec" 
  {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nfs-utils",
      "sudo mkdir -p /data/test",
      "sudo mount -t nfs ${aws_efs_file_system.app_efs.dns_name}:/ /data/test",
      "echo '${aws_efs_file_system.app_efs.dns_name}:/ /data/test nfs defaults 0 0' | sudo tee -a /etc/fstab"
    ]

    connection 
    {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/key.pem")
      host        = self.public_ip
    }
  }
}
