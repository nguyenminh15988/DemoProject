variable "region" {
  type = string
}
variable "cidr_block" {
  type = string
}
variable "avaibility_zone" {
  type = list(any)
}
variable "private_subnets" {
  type = list(any)
}
# variable "tag_privatesubnet" {
#   type = map(string)
#   default = {
#       privatesub1 = "bastionhost"
#       privatesub2 = "webserver"
#       privatesub3 = "ansible"
#   }
# }
variable "public_subnets" {
  type = list(any)
}
variable "instance_type" {
  type = string
}