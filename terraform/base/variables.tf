variable "allow_ip" {
  type = list(string)
}
variable "prefix" {
  type = string
}
variable "cidr_block" {
  type = string
}
variable "az" {
  type = list(string)
  default = [
    "ap-northeast-1a",
    "ap-northeast-1c"
  ]
}
variable "repos" {
  type = map(string)
}
variable "domain" {
  type = string
}
variable "ns" {
  type = list(string)
}
variable "torimo-pub" {
  type = string
}
variable "ssh_port" {
  type = number
}
