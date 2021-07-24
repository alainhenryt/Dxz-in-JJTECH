resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.DxzSky_VPC.id

  ingress {
    description      = "HTTPS"
    from_port        = var.Dxzsky_Sg_Ports["https"]
    to_port          = var.Dxzsky_Sg_Ports["https"]
    protocol         = "tcp"
    cidr_blocks      = [var.DxzSky_InternetCIDR]
   /*  ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block] */
  }
    ingress {
    description      = "HTTP"
    from_port        = var.Dxzsky_Sg_Ports["http"]
    to_port          = var.Dxzsky_Sg_Ports["http"]
    protocol         = "tcp"
    cidr_blocks      = [var.DxzSky_InternetCIDR]
   /*  ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block] */
  }
    ingress {
    description      = "SSH"
    from_port        = var.Dxzsky_Sg_Ports["ssh"]
    to_port          = var.Dxzsky_Sg_Ports["ssh"]
    protocol         = "tcp"
    cidr_blocks      = [var.DxzSky_InternetCIDR]
   /*  ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block] */
  }

  egress {
    from_port        = var.Dxzsky_Sg_Ports["egr1"]
    to_port          = var.Dxzsky_Sg_Ports["egr1"]
    protocol         = var.Dxzsky_Sg_Ports["egr2"]
    cidr_blocks      = [var.DxzSky_InternetCIDR]
    /* ipv6_cidr_blocks = ["::/0"] */
  }

  tags = {
    Name = "DxzSky_WebSg"
  }
}