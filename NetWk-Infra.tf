# Creating DexzonSky Infra.
resource "aws_vpc" "DxzSky_VPC" {
  cidr_block = "10.0.0.0/16"

tags = {
  Name = var.DxzSky_VPC-Env
  }
}

resource "aws_subnet" "DxzSky_AppSubN01" {
  vpc_id     = aws_vpc.DxzSky_VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "AppSubN01(TestingEnv)"
  }
}