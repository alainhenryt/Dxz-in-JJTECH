# Creating DxzSky WebServer.
resource "aws_instance" "DxzSky_WebSerUbt" {
  ami           = var.Dxzsky_ami_id["Ubt"]
  instance_type = var.Dxzsky_instance_type[0]
  availability_zone = var.DxzSky_AZs[0]
  /* subnet_id     = aws_subnet.DxzSky_WebSubN01.id */
  key_name      = var.DxzSky_Keypair

  network_interface {
    network_interface_id = aws_network_interface.DxzSky_NIC.id
    device_index         = 0
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo systemctl enable apache2
              sudo systemctl status apache2
              sudo bash -c 'echo my first web server > /var/www/html/index.html'
              EOF

  tags = {
    Name = var.DxzSky_ComputeTags[0]
  }

}

# Creating DxzSky AppServer.
resource "aws_instance" "DxzSky_AppSerLnx" {
  ami           = var.Dxzsky_ami_id["Lnx"]
  instance_type = var.Dxzsky_instance_type[1]
  /* availability_zone = var.DxzSky_AZs[1] */
  subnet_id     = aws_subnet.DxzSky_AppSubN01.id
  key_name      = var.DxzSky_Keypair

/*   network_interface {
    network_interface_id = aws_network_interface.DxzSky_NIC.id
    device_index         = 1
  } */

  tags = {
    Name = var.DxzSky_ComputeTags[1]
  }

}

/* resource "aws_network_interface" "DxzSky_NIC" {
  subnet_id     = aws_subnet.DxzSky_WebSubN01.id
  security_groups = [aws_security_group.allow_eip.id]
} */



