DxzSky_region = [ "us-west-2", "ca-central-1" ]
DxzSky_engineerprofile = "default"
DxzSky_Keypair         = "EC2-Ca-central-keypair"
DxzSky_CIDRs = [ "10.0.0.0/16", "10.0.1.0/24", "10.0.2.0/24" ]
DxzSky_InternetCIDR = "0.0.0.0/0"
DxzSky_AZs = [ "ca-central-1a", "ca-central-1b" ]
DxzSky_NetWrkTags = [ "DxzSky_VPC-Core",
                      "DxzSky_WebSubN01", "DxzSky_AppSubN01",
                      "Dxzsky_Igw",
                      "DxzSky_PubRt", "DxzSky_PrivRt",
                      "DxzSky_Ngw" 
                      ]

/* Dxzsky_ami_id = [ "Ubt =  "ami-0801628222e2e96d6"" , "Lnx =  "ami-07d95746fec4b20a3"" ] */

DxzSky_ComputeTags = [ "DxzSky_WebSerUbt", "DxzSky_AppSerLnx" ]

Dxzsky_instance_type = [ "t2.micro", "t2.micro" ]
