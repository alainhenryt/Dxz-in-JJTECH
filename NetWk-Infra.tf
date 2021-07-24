# Creating DexzonSky VPC.
resource "aws_vpc" "DxzSky_VPC" {
  cidr_block = var.DxzSky_CIDRs[0]

tags = {
  Name = var.DxzSky_NetWrkTags[0]
  }
}

# Creating DexzonSky PublicSubnet.
resource "aws_subnet" "DxzSky_WebSubN01" {
  vpc_id     = aws_vpc.DxzSky_VPC.id
  cidr_block = var.DxzSky_CIDRs[1]
  availability_zone = var.DxzSky_AZs[0]

  tags = {
    Name = var.DxzSky_NetWrkTags[1]
  }
}

# Creating DexzonSky PrivateSubnet.
resource "aws_subnet" "DxzSky_AppSubN01" {
  vpc_id     = aws_vpc.DxzSky_VPC.id
  cidr_block = var.DxzSky_CIDRs[2]
  availability_zone = var.DxzSky_AZs[1]

  tags = {
    Name = var.DxzSky_NetWrkTags[2]
  }
}

# Creating DexzonSky Internet Gatway.
resource "aws_internet_gateway" "DxzSky_Igw" {
  vpc_id = aws_vpc.DxzSky_VPC.id

  tags = {
    Name = var.DxzSky_NetWrkTags[3]
  }
}

# Creating DexzonSky PubRoutTable and Routing.
resource "aws_route_table" "DxzSky_PubRt" {
  vpc_id = aws_vpc.DxzSky_VPC.id

  route {
    cidr_block = var.DxzSky_InternetCIDR
    gateway_id = aws_internet_gateway.DxzSky_Igw.id
  }

  tags = {
    Name = var.DxzSky_NetWrkTags[4]
  }
}

# Creating DexzonSky PrivRoutTable and Routing.
resource "aws_route_table" "DxzSky_PrivRt" {
  vpc_id = aws_vpc.DxzSky_VPC.id

  route {
    cidr_block = var.DxzSky_InternetCIDR
    gateway_id = aws_nat_gateway.DxzSky_Ngw.id
  }

  tags = {
    Name = var.DxzSky_NetWrkTags[5]
  }
}

# Creating DexzonSky PubRoutTable Assocation.
resource "aws_route_table_association" "DxzSky_PubRtAss" {
  subnet_id      = aws_subnet.DxzSky_WebSubN01.id
  route_table_id = aws_route_table.DxzSky_PubRt.id
}

resource "aws_route_table_association" "DxzSky_PrivRtAss" {
  subnet_id      = aws_subnet.DxzSky_AppSubN01.id
  route_table_id = aws_route_table.DxzSky_PrivRt.id
}

resource "aws_nat_gateway" "DxzSky_Ngw" {
  allocation_id = aws_eip.DxzSky_NgwEIP.id
  subnet_id     = aws_subnet.DxzSky_WebSubN01.id

  tags = {
    Name = var.DxzSky_NetWrkTags[6]
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.DxzSky_Igw, aws_subnet.DxzSky_WebSubN01, aws_vpc.DxzSky_VPC]
}