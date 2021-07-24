variable "DxzSky_region" {
    type = list
}

variable "DxzSky_engineerprofile" {

}
variable "DxzSky_Keypair" {
    type = string
}

variable "DxzSky_NetWrkTags" {
    type = list
}

variable "DxzSky_CIDRs" {
    type = list
}

variable "DxzSky_InternetCIDR" {
    type = string
}

variable "DxzSky_AZs" {
    type = list
}

variable "DxzSky_ComputeTags" {
    type = list
}

variable "Dxzsky_ami_id" {
    type = map
    default = {
        Ubt =  "ami-0801628222e2e96d6",
        Lnx =  "ami-07d95746fec4b20a3"
    }
}

variable "Dxzsky_instance_type" {
    type = list
}

variable "Dxzsky_Sg_Ports" {
    type = map
    default = {
        https =  "443",
        ssh   =  "22",
        http  =  "80",
        egr1  =  "0",
        egr2  =  "-1"
    }
}
