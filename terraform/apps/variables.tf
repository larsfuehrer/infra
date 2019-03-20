variable "helm_repository_name" {}
variable "helm_repository_url" {}
variable "helm_release_name" {}
variable "helm_release_chart" {}
variable "helm_release_version" {}
variable "helm_release_repository" {
    default    = "stable"
}
variable "helm_release_set" {}
variable "helm_release_value" {}