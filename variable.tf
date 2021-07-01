variable "DxzSky_region" {
    type = list
}

variable "DxzSky_engineerprofile" {
    /* type = string */
}

variable "DxzSky_CIDR" {
    type = list
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "Dxz_envi" {
    type = string
    default = "DxzSky_TestingEnv-Ubuntu"

}

variable "DxzSky_VPC-Env" {
    type = string
    default = "DxzSky_VPC-TestingEnv"
}
