resource "aws_network_interface" "DxzSky_NIC" {
  subnet_id       = aws_subnet.DxzSky_WebSubN01.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_web.id]

/*   attachment {
    instance     = aws_instance.DxzSky_WebSerUbt.id
    device_index = 0
  } */
}

resource "aws_eip" "DxzSky_EIP" {
  vpc                       = true
  network_interface         = aws_network_interface.DxzSky_NIC.id
  associate_with_private_ip = "10.0.1.50"
  depends_on                = [aws_internet_gateway.DxzSky_Igw]
}

resource "aws_eip" "DxzSky_NgwEIP" {
  vpc      = true
}
output "DxzSky_NgwEIP" {
  value = aws_eip.DxzSky_NgwEIP.id
}

/* resource "aws_eip_association" "DxzSky_NgwEIP_assoc" {
  instance_id   = aws_instance.DxzSky_AppSerLnx.id
  allocation_id = aws_eip.DxzSky_NgwEIP.id

} */