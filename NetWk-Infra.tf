# Creating DexzonSky Infra.
resource "aws_vpc" "DxzSky_VPC" {
  cidr_block = var.DxzSky_CIDR[0]

tags = {
  Name = var.DxzSky_VPC-Env
  }
}

resource "aws_subnet" "DxzSky_AppSubN01" {
  vpc_id     = aws_vpc.DxzSky_VPC.id
  cidr_block = var.DxzSky_CIDR[1]

  tags = {
    Name = "AppSubN01(TestingEnv)"
  }
}