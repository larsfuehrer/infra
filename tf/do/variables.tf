variable "do_api_token" {}
variable "cluster_name" {}
variable "cluster_region" {}
variable "cluster_version" {}
variable "cluster_tags" {
    type    = "list"
    default = ["production"]
}
variable "node_pool_name" {}
variable "node_pool_size" {
    default     = "s-1vcpu-2gb"
    description = "Digital Ocean worker size (e.g. s-1vcpu-2gb, s-2vcpu-4gb, s-4vcpu-8gb)"
}
variable "node_pool_count" {
    default     = 3
}
variable "node_pool_tags" {
    type        = "list"
    default     = ["production"]
}
