provider "digitalocean" {
  version = ">= 1.1.0"
  token = "${var.do_api_token}"
}

provider "kubernetes" {
  host                    = "${digitalocean_kubernetes_cluster.default.endpoint}"

  client_certificate      = "${base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.client_certificate)}"
  client_key              = "${base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.client_key)}"
  cluster_ca_certificate  = "${base64decode(digitalocean_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)}"
}
resource "digitalocean_kubernetes_cluster" "default" {
  name        = "${var.cluster_name}"
  region      = "${var.cluster_region}"
  version     = "${var.cluster_version}"
  tags        = "${var.cluster_tags}"

  node_pool {
    name        = "${var.node_pool_name}"
    size        = "${var.node_pool_size}"
    node_count  = "${var.node_pool_count}"
    tags        = "${var.node_pool_tags}"
  }

}