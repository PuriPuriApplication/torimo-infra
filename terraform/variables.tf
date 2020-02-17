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
variable "repo" {
  type = list(string)
}
variable "domain" {
  type = string
}
variable "ns" {
  type = list(string)
}
