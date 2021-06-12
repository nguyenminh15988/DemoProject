//AWS 
region             = "us-east-1"
environment        = "dev"
availability_zones = [""]
/* module networking */
vpc_cidr             = "10.0.0.0/16"
public_subnets_cidr  = ["10.0.2.0/24"]  //List of Public subnet cidr range
private_subnets_cidr = ["10.0.20.0/24"] //List of private subnet cidr range

/* module ec2_instance */
ami_id                      = "ami-0d5eff06f840b45e9"
countinstance               = 1
instance_type               = "t2.micro"
associate_public_ip_address = true
key_name                    = "filekey"

