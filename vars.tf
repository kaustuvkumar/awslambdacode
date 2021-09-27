variable "AWS_ACCESS_KEY"{}
variable "AWS_SECRET_KEY"{}
variable "AWS_REGION"{
  default = "eu-west-1"
}
variable "AMIS" {
    type = "map"
    default = {
        us-east-1 = "ami-xxxxxxx"
        us-east-2 = "ami-xxxxxxx"
        eu-west-1 = "ami-xxxxxxx"
        
    }
}