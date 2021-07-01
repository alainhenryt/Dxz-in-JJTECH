variable "ami_id" {
    type = string
    default = "ami-0801628222e2e96d6"
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
